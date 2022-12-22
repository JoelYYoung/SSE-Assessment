; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType* %myUnion, metadata !23, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to i64*, !dbg !33
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to i64*, !dbg !37
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !35
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !38
  store i64* %4, i64** %data, align 8, !dbg !39
  %5 = load i64*, i64** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType* %myUnion to i64**, !dbg !41
  store i64* %5, i64** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType* %myUnion to i64**, !dbg !46
  %6 = load i64*, i64** %unionSecond, align 8, !dbg !46
  store i64* %6, i64** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %8, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %9, !dbg !68
  %10 = load i64, i64* %arrayidx, align 8, !dbg !68
  %11 = load i64*, i64** %data1, align 8, !dbg !69
  %12 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 %12, !dbg !69
  store i64 %10, i64* %arrayidx2, align 8, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %13, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %14 = load i64*, i64** %data1, align 8, !dbg !78
  %arrayidx3 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !78
  %15 = load i64, i64* %arrayidx3, align 8, !dbg !78
  call void @printLongLongLine(i64 %15), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 400, align 16, !dbg !112
  %1 = bitcast i8* %0 to i64*, !dbg !113
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 800, align 16, !dbg !116
  %3 = bitcast i8* %2 to i64*, !dbg !117
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !118
  store i64* %4, i64** %data, align 8, !dbg !119
  %5 = load i64*, i64** %data, align 8, !dbg !120
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType* %myUnion to i64**, !dbg !121
  store i64* %5, i64** %unionFirst, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType* %myUnion to i64**, !dbg !126
  %6 = load i64*, i64** %unionSecond, align 8, !dbg !126
  store i64* %6, i64** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %8, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %9, !dbg !142
  %10 = load i64, i64* %arrayidx, align 8, !dbg !142
  %11 = load i64*, i64** %data1, align 8, !dbg !143
  %12 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 %12, !dbg !143
  store i64 %10, i64* %arrayidx2, align 8, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %13, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %14 = load i64*, i64** %data1, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !151
  %15 = load i64, i64* %arrayidx3, align 8, !dbg !151
  call void @printLongLongLine(i64 %15), !dbg !152
  ret void, !dbg !153
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34.c", directory: "/root/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_bad", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 29, type: !4)
!22 = !DILocation(line: 29, column: 15, scope: !17)
!23 = !DILocalVariable(name: "myUnion", scope: !17, file: !18, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_unionType", file: !18, line: 23, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !18, line: 19, size: 64, elements: !26)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !25, file: !18, line: 21, baseType: !4, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !25, file: !18, line: 22, baseType: !4, size: 64)
!29 = !DILocation(line: 30, column: 81, scope: !17)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 31, type: !4)
!31 = !DILocation(line: 31, column: 15, scope: !17)
!32 = !DILocation(line: 31, column: 42, scope: !17)
!33 = !DILocation(line: 31, column: 31, scope: !17)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 32, type: !4)
!35 = !DILocation(line: 32, column: 15, scope: !17)
!36 = !DILocation(line: 32, column: 43, scope: !17)
!37 = !DILocation(line: 32, column: 32, scope: !17)
!38 = !DILocation(line: 35, column: 12, scope: !17)
!39 = !DILocation(line: 35, column: 10, scope: !17)
!40 = !DILocation(line: 36, column: 26, scope: !17)
!41 = !DILocation(line: 36, column: 13, scope: !17)
!42 = !DILocation(line: 36, column: 24, scope: !17)
!43 = !DILocalVariable(name: "data", scope: !44, file: !18, line: 38, type: !4)
!44 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 19, scope: !44)
!46 = !DILocation(line: 38, column: 34, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !18, line: 40, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !18, line: 39, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 40, column: 21, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !54, file: !18, line: 42, type: !55)
!54 = distinct !DILexicalBlock(scope: !48, file: !18, line: 41, column: 13)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 42, column: 24, scope: !54)
!59 = !DILocation(line: 44, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !18, line: 44, column: 17)
!61 = !DILocation(line: 44, column: 22, scope: !60)
!62 = !DILocation(line: 44, column: 29, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !18, line: 44, column: 17)
!64 = !DILocation(line: 44, column: 31, scope: !63)
!65 = !DILocation(line: 44, column: 17, scope: !60)
!66 = !DILocation(line: 46, column: 38, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !18, line: 45, column: 17)
!68 = !DILocation(line: 46, column: 31, scope: !67)
!69 = !DILocation(line: 46, column: 21, scope: !67)
!70 = !DILocation(line: 46, column: 26, scope: !67)
!71 = !DILocation(line: 46, column: 29, scope: !67)
!72 = !DILocation(line: 47, column: 17, scope: !67)
!73 = !DILocation(line: 44, column: 39, scope: !63)
!74 = !DILocation(line: 44, column: 17, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 47, column: 17, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 48, column: 35, scope: !54)
!79 = !DILocation(line: 48, column: 17, scope: !54)
!80 = !DILocation(line: 52, column: 1, scope: !17)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_34_good", scope: !18, file: !18, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 87, column: 5, scope: !81)
!83 = !DILocation(line: 88, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 99, type: !85, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !18, line: 99, type: !87)
!92 = !DILocation(line: 99, column: 14, scope: !84)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !18, line: 99, type: !88)
!94 = !DILocation(line: 99, column: 27, scope: !84)
!95 = !DILocation(line: 102, column: 22, scope: !84)
!96 = !DILocation(line: 102, column: 12, scope: !84)
!97 = !DILocation(line: 102, column: 5, scope: !84)
!98 = !DILocation(line: 104, column: 5, scope: !84)
!99 = !DILocation(line: 105, column: 5, scope: !84)
!100 = !DILocation(line: 106, column: 5, scope: !84)
!101 = !DILocation(line: 109, column: 5, scope: !84)
!102 = !DILocation(line: 110, column: 5, scope: !84)
!103 = !DILocation(line: 111, column: 5, scope: !84)
!104 = !DILocation(line: 113, column: 5, scope: !84)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !18, line: 61, type: !4)
!107 = !DILocation(line: 61, column: 15, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !18, line: 62, type: !24)
!109 = !DILocation(line: 62, column: 81, scope: !105)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !18, line: 63, type: !4)
!111 = !DILocation(line: 63, column: 15, scope: !105)
!112 = !DILocation(line: 63, column: 42, scope: !105)
!113 = !DILocation(line: 63, column: 31, scope: !105)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !18, line: 64, type: !4)
!115 = !DILocation(line: 64, column: 15, scope: !105)
!116 = !DILocation(line: 64, column: 43, scope: !105)
!117 = !DILocation(line: 64, column: 32, scope: !105)
!118 = !DILocation(line: 66, column: 12, scope: !105)
!119 = !DILocation(line: 66, column: 10, scope: !105)
!120 = !DILocation(line: 67, column: 26, scope: !105)
!121 = !DILocation(line: 67, column: 13, scope: !105)
!122 = !DILocation(line: 67, column: 24, scope: !105)
!123 = !DILocalVariable(name: "data", scope: !124, file: !18, line: 69, type: !4)
!124 = distinct !DILexicalBlock(scope: !105, file: !18, line: 68, column: 5)
!125 = !DILocation(line: 69, column: 19, scope: !124)
!126 = !DILocation(line: 69, column: 34, scope: !124)
!127 = !DILocalVariable(name: "source", scope: !128, file: !18, line: 71, type: !49)
!128 = distinct !DILexicalBlock(scope: !124, file: !18, line: 70, column: 9)
!129 = !DILocation(line: 71, column: 21, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !131, file: !18, line: 73, type: !55)
!131 = distinct !DILexicalBlock(scope: !128, file: !18, line: 72, column: 13)
!132 = !DILocation(line: 73, column: 24, scope: !131)
!133 = !DILocation(line: 75, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !18, line: 75, column: 17)
!135 = !DILocation(line: 75, column: 22, scope: !134)
!136 = !DILocation(line: 75, column: 29, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !18, line: 75, column: 17)
!138 = !DILocation(line: 75, column: 31, scope: !137)
!139 = !DILocation(line: 75, column: 17, scope: !134)
!140 = !DILocation(line: 77, column: 38, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !18, line: 76, column: 17)
!142 = !DILocation(line: 77, column: 31, scope: !141)
!143 = !DILocation(line: 77, column: 21, scope: !141)
!144 = !DILocation(line: 77, column: 26, scope: !141)
!145 = !DILocation(line: 77, column: 29, scope: !141)
!146 = !DILocation(line: 78, column: 17, scope: !141)
!147 = !DILocation(line: 75, column: 39, scope: !137)
!148 = !DILocation(line: 75, column: 17, scope: !137)
!149 = distinct !{!149, !139, !150, !77}
!150 = !DILocation(line: 78, column: 17, scope: !134)
!151 = !DILocation(line: 79, column: 35, scope: !131)
!152 = !DILocation(line: 79, column: 17, scope: !131)
!153 = !DILocation(line: 83, column: 1, scope: !105)
