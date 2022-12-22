; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !31
  store i64* %4, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %6, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !56
  %8 = load i64, i64* %arrayidx, align 8, !dbg !56
  %9 = load i64*, i64** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !57
  store i64 %8, i64* %arrayidx1, align 8, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %11, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !66
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !66
  call void @printLongLongLine(i64 %13), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i64*, !dbg !100
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 800, align 16, !dbg !103
  %3 = bitcast i8* %2 to i64*, !dbg !104
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !102
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !105
  store i64* %4, i64** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !118
  %cmp = icmp ult i64 %6, 100, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !124
  %8 = load i64, i64* %arrayidx, align 8, !dbg !124
  %9 = load i64*, i64** %data, align 8, !dbg !125
  %10 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !125
  store i64 %8, i64* %arrayidx1, align 8, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %11, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !133
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !133
  call void @printLongLongLine(i64 %13), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %0 = alloca i8, i64 400, align 16, !dbg !141
  %1 = bitcast i8* %0 to i64*, !dbg !142
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  %2 = alloca i8, i64 800, align 16, !dbg !145
  %3 = bitcast i8* %2 to i64*, !dbg !146
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !144
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !147
  store i64* %4, i64** %data, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !151, metadata !DIExpression()), !dbg !153
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !160
  %cmp = icmp ult i64 %6, 100, !dbg !162
  br i1 %cmp, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !166
  %8 = load i64, i64* %arrayidx, align 8, !dbg !166
  %9 = load i64*, i64** %data, align 8, !dbg !167
  %10 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !167
  store i64 %8, i64* %arrayidx1, align 8, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %11, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !175
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !175
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !175
  call void @printLongLongLine(i64 %13), !dbg !176
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06.c", directory: "/root/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06_bad", scope: !18, file: !18, line: 25, type: !19, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 27, type: !4)
!22 = !DILocation(line: 27, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 28, type: !4)
!24 = !DILocation(line: 28, column: 15, scope: !17)
!25 = !DILocation(line: 28, column: 42, scope: !17)
!26 = !DILocation(line: 28, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 15, scope: !17)
!29 = !DILocation(line: 29, column: 43, scope: !17)
!30 = !DILocation(line: 29, column: 32, scope: !17)
!31 = !DILocation(line: 34, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !18, line: 31, column: 5)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 30, column: 8)
!34 = !DILocation(line: 34, column: 14, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !18, line: 37, type: !37)
!36 = distinct !DILexicalBlock(scope: !17, file: !18, line: 36, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 37, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !18, line: 39, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !18, line: 38, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 39, column: 20, scope: !42)
!47 = !DILocation(line: 41, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !18, line: 41, column: 13)
!49 = !DILocation(line: 41, column: 18, scope: !48)
!50 = !DILocation(line: 41, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !18, line: 41, column: 13)
!52 = !DILocation(line: 41, column: 27, scope: !51)
!53 = !DILocation(line: 41, column: 13, scope: !48)
!54 = !DILocation(line: 43, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !18, line: 42, column: 13)
!56 = !DILocation(line: 43, column: 27, scope: !55)
!57 = !DILocation(line: 43, column: 17, scope: !55)
!58 = !DILocation(line: 43, column: 22, scope: !55)
!59 = !DILocation(line: 43, column: 25, scope: !55)
!60 = !DILocation(line: 44, column: 13, scope: !55)
!61 = !DILocation(line: 41, column: 35, scope: !51)
!62 = !DILocation(line: 41, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 44, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 45, column: 31, scope: !42)
!67 = !DILocation(line: 45, column: 13, scope: !42)
!68 = !DILocation(line: 48, column: 1, scope: !17)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_06_good", scope: !18, file: !18, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 111, column: 5, scope: !69)
!71 = !DILocation(line: 112, column: 5, scope: !69)
!72 = !DILocation(line: 113, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 125, type: !74, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !18, line: 125, type: !76)
!81 = !DILocation(line: 125, column: 14, scope: !73)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !18, line: 125, type: !77)
!83 = !DILocation(line: 125, column: 27, scope: !73)
!84 = !DILocation(line: 128, column: 22, scope: !73)
!85 = !DILocation(line: 128, column: 12, scope: !73)
!86 = !DILocation(line: 128, column: 5, scope: !73)
!87 = !DILocation(line: 130, column: 5, scope: !73)
!88 = !DILocation(line: 131, column: 5, scope: !73)
!89 = !DILocation(line: 132, column: 5, scope: !73)
!90 = !DILocation(line: 135, column: 5, scope: !73)
!91 = !DILocation(line: 136, column: 5, scope: !73)
!92 = !DILocation(line: 137, column: 5, scope: !73)
!93 = !DILocation(line: 139, column: 5, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !18, line: 57, type: !4)
!96 = !DILocation(line: 57, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !18, line: 58, type: !4)
!98 = !DILocation(line: 58, column: 15, scope: !94)
!99 = !DILocation(line: 58, column: 42, scope: !94)
!100 = !DILocation(line: 58, column: 31, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !18, line: 59, type: !4)
!102 = !DILocation(line: 59, column: 15, scope: !94)
!103 = !DILocation(line: 59, column: 43, scope: !94)
!104 = !DILocation(line: 59, column: 32, scope: !94)
!105 = !DILocation(line: 68, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !18, line: 66, column: 5)
!107 = distinct !DILexicalBlock(scope: !94, file: !18, line: 60, column: 8)
!108 = !DILocation(line: 68, column: 14, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !18, line: 71, type: !37)
!110 = distinct !DILexicalBlock(scope: !94, file: !18, line: 70, column: 5)
!111 = !DILocation(line: 71, column: 17, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !113, file: !18, line: 73, type: !43)
!113 = distinct !DILexicalBlock(scope: !110, file: !18, line: 72, column: 9)
!114 = !DILocation(line: 73, column: 20, scope: !113)
!115 = !DILocation(line: 75, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !18, line: 75, column: 13)
!117 = !DILocation(line: 75, column: 18, scope: !116)
!118 = !DILocation(line: 75, column: 25, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !18, line: 75, column: 13)
!120 = !DILocation(line: 75, column: 27, scope: !119)
!121 = !DILocation(line: 75, column: 13, scope: !116)
!122 = !DILocation(line: 77, column: 34, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !18, line: 76, column: 13)
!124 = !DILocation(line: 77, column: 27, scope: !123)
!125 = !DILocation(line: 77, column: 17, scope: !123)
!126 = !DILocation(line: 77, column: 22, scope: !123)
!127 = !DILocation(line: 77, column: 25, scope: !123)
!128 = !DILocation(line: 78, column: 13, scope: !123)
!129 = !DILocation(line: 75, column: 35, scope: !119)
!130 = !DILocation(line: 75, column: 13, scope: !119)
!131 = distinct !{!131, !121, !132, !65}
!132 = !DILocation(line: 78, column: 13, scope: !116)
!133 = !DILocation(line: 79, column: 31, scope: !113)
!134 = !DILocation(line: 79, column: 13, scope: !113)
!135 = !DILocation(line: 82, column: 1, scope: !94)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !18, line: 87, type: !4)
!138 = !DILocation(line: 87, column: 15, scope: !136)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !136, file: !18, line: 88, type: !4)
!140 = !DILocation(line: 88, column: 15, scope: !136)
!141 = !DILocation(line: 88, column: 42, scope: !136)
!142 = !DILocation(line: 88, column: 31, scope: !136)
!143 = !DILocalVariable(name: "dataGoodBuffer", scope: !136, file: !18, line: 89, type: !4)
!144 = !DILocation(line: 89, column: 15, scope: !136)
!145 = !DILocation(line: 89, column: 43, scope: !136)
!146 = !DILocation(line: 89, column: 32, scope: !136)
!147 = !DILocation(line: 93, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !18, line: 91, column: 5)
!149 = distinct !DILexicalBlock(scope: !136, file: !18, line: 90, column: 8)
!150 = !DILocation(line: 93, column: 14, scope: !148)
!151 = !DILocalVariable(name: "source", scope: !152, file: !18, line: 96, type: !37)
!152 = distinct !DILexicalBlock(scope: !136, file: !18, line: 95, column: 5)
!153 = !DILocation(line: 96, column: 17, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !155, file: !18, line: 98, type: !43)
!155 = distinct !DILexicalBlock(scope: !152, file: !18, line: 97, column: 9)
!156 = !DILocation(line: 98, column: 20, scope: !155)
!157 = !DILocation(line: 100, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !18, line: 100, column: 13)
!159 = !DILocation(line: 100, column: 18, scope: !158)
!160 = !DILocation(line: 100, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !18, line: 100, column: 13)
!162 = !DILocation(line: 100, column: 27, scope: !161)
!163 = !DILocation(line: 100, column: 13, scope: !158)
!164 = !DILocation(line: 102, column: 34, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !18, line: 101, column: 13)
!166 = !DILocation(line: 102, column: 27, scope: !165)
!167 = !DILocation(line: 102, column: 17, scope: !165)
!168 = !DILocation(line: 102, column: 22, scope: !165)
!169 = !DILocation(line: 102, column: 25, scope: !165)
!170 = !DILocation(line: 103, column: 13, scope: !165)
!171 = !DILocation(line: 100, column: 35, scope: !161)
!172 = !DILocation(line: 100, column: 13, scope: !161)
!173 = distinct !{!173, !163, !174, !65}
!174 = !DILocation(line: 103, column: 13, scope: !158)
!175 = !DILocation(line: 104, column: 31, scope: !155)
!176 = !DILocation(line: 104, column: 13, scope: !155)
!177 = !DILocation(line: 107, column: 1, scope: !136)
