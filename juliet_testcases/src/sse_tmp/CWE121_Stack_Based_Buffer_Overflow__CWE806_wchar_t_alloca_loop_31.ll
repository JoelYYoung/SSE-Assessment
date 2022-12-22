; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %5, i32** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !37
  store i32* %6, i32** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %8 = load i32*, i32** %data1, align 8, !dbg !50
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !51
  store i64 %call2, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !56
  %10 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp = icmp ult i64 %9, %10, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !61
  %12 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !61
  %13 = load i32, i32* %arrayidx3, align 4, !dbg !61
  %14 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %14, !dbg !65
  store i32 %13, i32* %arrayidx4, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %15, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !73
  store i32 0, i32* %arrayidx5, align 4, !dbg !74
  %16 = load i32*, i32** %data1, align 8, !dbg !75
  call void @printWLine(i32* %16), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 400, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %2, i32** %data, align 8, !dbg !109
  %3 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !111
  %4 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !114, metadata !DIExpression()), !dbg !116
  %5 = load i32*, i32** %data, align 8, !dbg !117
  store i32* %5, i32** %dataCopy, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !118, metadata !DIExpression()), !dbg !119
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !120
  store i32* %6, i32** %data1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %8 = load i32*, i32** %data1, align 8, !dbg !128
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !129
  store i64 %call2, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !134
  %10 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp = icmp ult i64 %9, %10, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !139
  %12 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !139
  %13 = load i32, i32* %arrayidx3, align 4, !dbg !139
  %14 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %14, !dbg !143
  store i32 %13, i32* %arrayidx4, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %15, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !150
  store i32 0, i32* %arrayidx5, align 4, !dbg !151
  %16 = load i32*, i32** %data1, align 8, !dbg !152
  call void @printWLine(i32* %16), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 29, column: 13, scope: !15)
!28 = !DILocation(line: 29, column: 5, scope: !15)
!29 = !DILocation(line: 30, column: 5, scope: !15)
!30 = !DILocation(line: 30, column: 17, scope: !15)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !16, line: 32, type: !4)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!33 = !DILocation(line: 32, column: 19, scope: !32)
!34 = !DILocation(line: 32, column: 30, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !16, line: 33, type: !4)
!36 = !DILocation(line: 33, column: 19, scope: !32)
!37 = !DILocation(line: 33, column: 26, scope: !32)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !16, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !32, file: !16, line: 34, column: 9)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 21, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 36, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 20, scope: !39)
!48 = !DILocalVariable(name: "dataLen", scope: !39, file: !16, line: 36, type: !45)
!49 = !DILocation(line: 36, column: 23, scope: !39)
!50 = !DILocation(line: 37, column: 30, scope: !39)
!51 = !DILocation(line: 37, column: 23, scope: !39)
!52 = !DILocation(line: 37, column: 21, scope: !39)
!53 = !DILocation(line: 39, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !16, line: 39, column: 13)
!55 = !DILocation(line: 39, column: 18, scope: !54)
!56 = !DILocation(line: 39, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !16, line: 39, column: 13)
!58 = !DILocation(line: 39, column: 29, scope: !57)
!59 = !DILocation(line: 39, column: 27, scope: !57)
!60 = !DILocation(line: 39, column: 13, scope: !54)
!61 = !DILocation(line: 41, column: 27, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !16, line: 40, column: 13)
!63 = !DILocation(line: 41, column: 32, scope: !62)
!64 = !DILocation(line: 41, column: 22, scope: !62)
!65 = !DILocation(line: 41, column: 17, scope: !62)
!66 = !DILocation(line: 41, column: 25, scope: !62)
!67 = !DILocation(line: 42, column: 13, scope: !62)
!68 = !DILocation(line: 39, column: 39, scope: !57)
!69 = !DILocation(line: 39, column: 13, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 42, column: 13, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 43, column: 13, scope: !39)
!74 = !DILocation(line: 43, column: 24, scope: !39)
!75 = !DILocation(line: 44, column: 24, scope: !39)
!76 = !DILocation(line: 44, column: 13, scope: !39)
!77 = !DILocation(line: 47, column: 1, scope: !15)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_31_good", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 82, column: 5, scope: !78)
!80 = !DILocation(line: 83, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !82, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !16, line: 94, type: !7)
!88 = !DILocation(line: 94, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !16, line: 94, type: !84)
!90 = !DILocation(line: 94, column: 27, scope: !81)
!91 = !DILocation(line: 97, column: 22, scope: !81)
!92 = !DILocation(line: 97, column: 12, scope: !81)
!93 = !DILocation(line: 97, column: 5, scope: !81)
!94 = !DILocation(line: 99, column: 5, scope: !81)
!95 = !DILocation(line: 100, column: 5, scope: !81)
!96 = !DILocation(line: 101, column: 5, scope: !81)
!97 = !DILocation(line: 104, column: 5, scope: !81)
!98 = !DILocation(line: 105, column: 5, scope: !81)
!99 = !DILocation(line: 106, column: 5, scope: !81)
!100 = !DILocation(line: 108, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 56, type: !4)
!103 = !DILocation(line: 56, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !16, line: 57, type: !4)
!105 = !DILocation(line: 57, column: 15, scope: !101)
!106 = !DILocation(line: 57, column: 39, scope: !101)
!107 = !DILocation(line: 57, column: 28, scope: !101)
!108 = !DILocation(line: 58, column: 12, scope: !101)
!109 = !DILocation(line: 58, column: 10, scope: !101)
!110 = !DILocation(line: 60, column: 13, scope: !101)
!111 = !DILocation(line: 60, column: 5, scope: !101)
!112 = !DILocation(line: 61, column: 5, scope: !101)
!113 = !DILocation(line: 61, column: 16, scope: !101)
!114 = !DILocalVariable(name: "dataCopy", scope: !115, file: !16, line: 63, type: !4)
!115 = distinct !DILexicalBlock(scope: !101, file: !16, line: 62, column: 5)
!116 = !DILocation(line: 63, column: 19, scope: !115)
!117 = !DILocation(line: 63, column: 30, scope: !115)
!118 = !DILocalVariable(name: "data", scope: !115, file: !16, line: 64, type: !4)
!119 = !DILocation(line: 64, column: 19, scope: !115)
!120 = !DILocation(line: 64, column: 26, scope: !115)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !16, line: 66, type: !40)
!122 = distinct !DILexicalBlock(scope: !115, file: !16, line: 65, column: 9)
!123 = !DILocation(line: 66, column: 21, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !16, line: 67, type: !45)
!125 = !DILocation(line: 67, column: 20, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !16, line: 67, type: !45)
!127 = !DILocation(line: 67, column: 23, scope: !122)
!128 = !DILocation(line: 68, column: 30, scope: !122)
!129 = !DILocation(line: 68, column: 23, scope: !122)
!130 = !DILocation(line: 68, column: 21, scope: !122)
!131 = !DILocation(line: 70, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !16, line: 70, column: 13)
!133 = !DILocation(line: 70, column: 18, scope: !132)
!134 = !DILocation(line: 70, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !16, line: 70, column: 13)
!136 = !DILocation(line: 70, column: 29, scope: !135)
!137 = !DILocation(line: 70, column: 27, scope: !135)
!138 = !DILocation(line: 70, column: 13, scope: !132)
!139 = !DILocation(line: 72, column: 27, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !16, line: 71, column: 13)
!141 = !DILocation(line: 72, column: 32, scope: !140)
!142 = !DILocation(line: 72, column: 22, scope: !140)
!143 = !DILocation(line: 72, column: 17, scope: !140)
!144 = !DILocation(line: 72, column: 25, scope: !140)
!145 = !DILocation(line: 73, column: 13, scope: !140)
!146 = !DILocation(line: 70, column: 39, scope: !135)
!147 = !DILocation(line: 70, column: 13, scope: !135)
!148 = distinct !{!148, !138, !149, !72}
!149 = !DILocation(line: 73, column: 13, scope: !132)
!150 = !DILocation(line: 74, column: 13, scope: !122)
!151 = !DILocation(line: 74, column: 24, scope: !122)
!152 = !DILocation(line: 75, column: 24, scope: !122)
!153 = !DILocation(line: 75, column: 13, scope: !122)
!154 = !DILocation(line: 78, column: 1, scope: !101)
