; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !23, metadata !DIExpression()), !dbg !25
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !26, metadata !DIExpression()), !dbg !27
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %4 = load i64**, i64*** %dataPtr1, align 8, !dbg !39
  %5 = load i64*, i64** %4, align 8, !dbg !40
  store i64* %5, i64** %data1, align 8, !dbg !38
  %6 = load i64*, i64** %dataBadBuffer, align 8, !dbg !41
  store i64* %6, i64** %data1, align 8, !dbg !42
  %7 = load i64*, i64** %data1, align 8, !dbg !43
  %8 = load i64**, i64*** %dataPtr1, align 8, !dbg !44
  store i64* %7, i64** %8, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %9 = load i64**, i64*** %dataPtr2, align 8, !dbg !49
  %10 = load i64*, i64** %9, align 8, !dbg !50
  store i64* %10, i64** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %11 = bitcast [100 x i64]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 800, i1 false), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !57, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !66
  %cmp = icmp ult i64 %12, 100, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %13, !dbg !72
  %14 = load i64, i64* %arrayidx, align 8, !dbg !72
  %15 = load i64*, i64** %data2, align 8, !dbg !73
  %16 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds i64, i64* %15, i64 %16, !dbg !73
  store i64 %14, i64* %arrayidx3, align 8, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %17, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %18 = load i64*, i64** %data2, align 8, !dbg !82
  %arrayidx4 = getelementptr inbounds i64, i64* %18, i64 0, !dbg !82
  %19 = load i64, i64* %arrayidx4, align 8, !dbg !82
  call void @printLongLongLine(i64 %19), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #5, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #5, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !112, metadata !DIExpression()), !dbg !113
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !114, metadata !DIExpression()), !dbg !115
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 400, align 16, !dbg !118
  %1 = bitcast i8* %0 to i64*, !dbg !119
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 800, align 16, !dbg !122
  %3 = bitcast i8* %2 to i64*, !dbg !123
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %4 = load i64**, i64*** %dataPtr1, align 8, !dbg !127
  %5 = load i64*, i64** %4, align 8, !dbg !128
  store i64* %5, i64** %data1, align 8, !dbg !126
  %6 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !129
  store i64* %6, i64** %data1, align 8, !dbg !130
  %7 = load i64*, i64** %data1, align 8, !dbg !131
  %8 = load i64**, i64*** %dataPtr1, align 8, !dbg !132
  store i64* %7, i64** %8, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !134, metadata !DIExpression()), !dbg !136
  %9 = load i64**, i64*** %dataPtr2, align 8, !dbg !137
  %10 = load i64*, i64** %9, align 8, !dbg !138
  store i64* %10, i64** %data2, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %11 = bitcast [100 x i64]* %source to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 800, i1 false), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !148
  %cmp = icmp ult i64 %12, 100, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %13, !dbg !154
  %14 = load i64, i64* %arrayidx, align 8, !dbg !154
  %15 = load i64*, i64** %data2, align 8, !dbg !155
  %16 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx3 = getelementptr inbounds i64, i64* %15, i64 %16, !dbg !155
  store i64 %14, i64* %arrayidx3, align 8, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %17, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %18 = load i64*, i64** %data2, align 8, !dbg !163
  %arrayidx4 = getelementptr inbounds i64, i64* %18, i64 0, !dbg !163
  %19 = load i64, i64* %arrayidx4, align 8, !dbg !163
  call void @printLongLongLine(i64 %19), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataPtr1", scope: !17, file: !18, line: 24, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!25 = !DILocation(line: 24, column: 16, scope: !17)
!26 = !DILocalVariable(name: "dataPtr2", scope: !17, file: !18, line: 25, type: !24)
!27 = !DILocation(line: 25, column: 16, scope: !17)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !4)
!29 = !DILocation(line: 26, column: 15, scope: !17)
!30 = !DILocation(line: 26, column: 42, scope: !17)
!31 = !DILocation(line: 26, column: 31, scope: !17)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !4)
!33 = !DILocation(line: 27, column: 15, scope: !17)
!34 = !DILocation(line: 27, column: 43, scope: !17)
!35 = !DILocation(line: 27, column: 32, scope: !17)
!36 = !DILocalVariable(name: "data", scope: !37, file: !18, line: 29, type: !4)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 5)
!38 = !DILocation(line: 29, column: 19, scope: !37)
!39 = !DILocation(line: 29, column: 27, scope: !37)
!40 = !DILocation(line: 29, column: 26, scope: !37)
!41 = !DILocation(line: 32, column: 16, scope: !37)
!42 = !DILocation(line: 32, column: 14, scope: !37)
!43 = !DILocation(line: 33, column: 21, scope: !37)
!44 = !DILocation(line: 33, column: 10, scope: !37)
!45 = !DILocation(line: 33, column: 19, scope: !37)
!46 = !DILocalVariable(name: "data", scope: !47, file: !18, line: 36, type: !4)
!47 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!48 = !DILocation(line: 36, column: 19, scope: !47)
!49 = !DILocation(line: 36, column: 27, scope: !47)
!50 = !DILocation(line: 36, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !18, line: 38, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !18, line: 37, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 38, column: 21, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !58, file: !18, line: 40, type: !59)
!58 = distinct !DILexicalBlock(scope: !52, file: !18, line: 39, column: 13)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 46, baseType: !61)
!60 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 40, column: 24, scope: !58)
!63 = !DILocation(line: 42, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !18, line: 42, column: 17)
!65 = !DILocation(line: 42, column: 22, scope: !64)
!66 = !DILocation(line: 42, column: 29, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !18, line: 42, column: 17)
!68 = !DILocation(line: 42, column: 31, scope: !67)
!69 = !DILocation(line: 42, column: 17, scope: !64)
!70 = !DILocation(line: 44, column: 38, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !18, line: 43, column: 17)
!72 = !DILocation(line: 44, column: 31, scope: !71)
!73 = !DILocation(line: 44, column: 21, scope: !71)
!74 = !DILocation(line: 44, column: 26, scope: !71)
!75 = !DILocation(line: 44, column: 29, scope: !71)
!76 = !DILocation(line: 45, column: 17, scope: !71)
!77 = !DILocation(line: 42, column: 39, scope: !67)
!78 = !DILocation(line: 42, column: 17, scope: !67)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 45, column: 17, scope: !64)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 46, column: 35, scope: !58)
!83 = !DILocation(line: 46, column: 17, scope: !58)
!84 = !DILocation(line: 50, column: 1, scope: !17)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_32_good", scope: !18, file: !18, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 89, column: 5, scope: !85)
!87 = !DILocation(line: 90, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 101, type: !89, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !18, line: 101, type: !91)
!96 = !DILocation(line: 101, column: 14, scope: !88)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !18, line: 101, type: !92)
!98 = !DILocation(line: 101, column: 27, scope: !88)
!99 = !DILocation(line: 104, column: 22, scope: !88)
!100 = !DILocation(line: 104, column: 12, scope: !88)
!101 = !DILocation(line: 104, column: 5, scope: !88)
!102 = !DILocation(line: 106, column: 5, scope: !88)
!103 = !DILocation(line: 107, column: 5, scope: !88)
!104 = !DILocation(line: 108, column: 5, scope: !88)
!105 = !DILocation(line: 111, column: 5, scope: !88)
!106 = !DILocation(line: 112, column: 5, scope: !88)
!107 = !DILocation(line: 113, column: 5, scope: !88)
!108 = !DILocation(line: 115, column: 5, scope: !88)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !18, line: 59, type: !4)
!111 = !DILocation(line: 59, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataPtr1", scope: !109, file: !18, line: 60, type: !24)
!113 = !DILocation(line: 60, column: 16, scope: !109)
!114 = !DILocalVariable(name: "dataPtr2", scope: !109, file: !18, line: 61, type: !24)
!115 = !DILocation(line: 61, column: 16, scope: !109)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !18, line: 62, type: !4)
!117 = !DILocation(line: 62, column: 15, scope: !109)
!118 = !DILocation(line: 62, column: 42, scope: !109)
!119 = !DILocation(line: 62, column: 31, scope: !109)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !18, line: 63, type: !4)
!121 = !DILocation(line: 63, column: 15, scope: !109)
!122 = !DILocation(line: 63, column: 43, scope: !109)
!123 = !DILocation(line: 63, column: 32, scope: !109)
!124 = !DILocalVariable(name: "data", scope: !125, file: !18, line: 65, type: !4)
!125 = distinct !DILexicalBlock(scope: !109, file: !18, line: 64, column: 5)
!126 = !DILocation(line: 65, column: 19, scope: !125)
!127 = !DILocation(line: 65, column: 27, scope: !125)
!128 = !DILocation(line: 65, column: 26, scope: !125)
!129 = !DILocation(line: 67, column: 16, scope: !125)
!130 = !DILocation(line: 67, column: 14, scope: !125)
!131 = !DILocation(line: 68, column: 21, scope: !125)
!132 = !DILocation(line: 68, column: 10, scope: !125)
!133 = !DILocation(line: 68, column: 19, scope: !125)
!134 = !DILocalVariable(name: "data", scope: !135, file: !18, line: 71, type: !4)
!135 = distinct !DILexicalBlock(scope: !109, file: !18, line: 70, column: 5)
!136 = !DILocation(line: 71, column: 19, scope: !135)
!137 = !DILocation(line: 71, column: 27, scope: !135)
!138 = !DILocation(line: 71, column: 26, scope: !135)
!139 = !DILocalVariable(name: "source", scope: !140, file: !18, line: 73, type: !53)
!140 = distinct !DILexicalBlock(scope: !135, file: !18, line: 72, column: 9)
!141 = !DILocation(line: 73, column: 21, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !18, line: 75, type: !59)
!143 = distinct !DILexicalBlock(scope: !140, file: !18, line: 74, column: 13)
!144 = !DILocation(line: 75, column: 24, scope: !143)
!145 = !DILocation(line: 77, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !18, line: 77, column: 17)
!147 = !DILocation(line: 77, column: 22, scope: !146)
!148 = !DILocation(line: 77, column: 29, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !18, line: 77, column: 17)
!150 = !DILocation(line: 77, column: 31, scope: !149)
!151 = !DILocation(line: 77, column: 17, scope: !146)
!152 = !DILocation(line: 79, column: 38, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !18, line: 78, column: 17)
!154 = !DILocation(line: 79, column: 31, scope: !153)
!155 = !DILocation(line: 79, column: 21, scope: !153)
!156 = !DILocation(line: 79, column: 26, scope: !153)
!157 = !DILocation(line: 79, column: 29, scope: !153)
!158 = !DILocation(line: 80, column: 17, scope: !153)
!159 = !DILocation(line: 77, column: 39, scope: !149)
!160 = !DILocation(line: 77, column: 17, scope: !149)
!161 = distinct !{!161, !151, !162, !81}
!162 = !DILocation(line: 80, column: 17, scope: !146)
!163 = !DILocation(line: 81, column: 35, scope: !143)
!164 = !DILocation(line: 81, column: 17, scope: !143)
!165 = !DILocation(line: 85, column: 1, scope: !109)
