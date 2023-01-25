; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %6 = bitcast i32* %arraydecay to i8*, !dbg !37
  %7 = load i32*, i32** %data, align 8, !dbg !38
  %8 = bitcast i32* %7 to i8*, !dbg !37
  %9 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i64 @wcslen(i32* %9) #8, !dbg !40
  %mul = mul i64 %call1, 4, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %10 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %10), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 400, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBuffer, align 8, !dbg !75
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %2, i32** %data, align 8, !dbg !79
  %3 = load i32*, i32** %data, align 8, !dbg !80
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !81
  %4 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !86
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !87
  %6 = bitcast i32* %arraydecay to i8*, !dbg !87
  %7 = load i32*, i32** %data, align 8, !dbg !88
  %8 = bitcast i32* %7 to i8*, !dbg !87
  %9 = load i32*, i32** %data, align 8, !dbg !89
  %call1 = call i64 @wcslen(i32* %9) #8, !dbg !90
  %mul = mul i64 %call1, 4, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !87
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !92
  store i32 0, i32* %arrayidx2, align 4, !dbg !93
  %10 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %10), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 400, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBuffer, align 8, !dbg !101
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %2, i32** %data, align 8, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !113
  %6 = bitcast i32* %arraydecay to i8*, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = bitcast i32* %7 to i8*, !dbg !113
  %9 = load i32*, i32** %data, align 8, !dbg !115
  %call1 = call i64 @wcslen(i32* %9) #8, !dbg !116
  %mul = mul i64 %call1, 4, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !113
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !118
  store i32 0, i32* %arrayidx2, align 4, !dbg !119
  %10 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %10), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 32, column: 17, scope: !15)
!28 = !DILocation(line: 32, column: 9, scope: !15)
!29 = !DILocation(line: 33, column: 9, scope: !15)
!30 = !DILocation(line: 33, column: 21, scope: !15)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !16, line: 41, type: !33)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 41, column: 17, scope: !32)
!37 = !DILocation(line: 43, column: 9, scope: !32)
!38 = !DILocation(line: 43, column: 22, scope: !32)
!39 = !DILocation(line: 43, column: 35, scope: !32)
!40 = !DILocation(line: 43, column: 28, scope: !32)
!41 = !DILocation(line: 43, column: 40, scope: !32)
!42 = !DILocation(line: 44, column: 9, scope: !32)
!43 = !DILocation(line: 44, column: 20, scope: !32)
!44 = !DILocation(line: 45, column: 20, scope: !32)
!45 = !DILocation(line: 45, column: 9, scope: !32)
!46 = !DILocation(line: 47, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_15_good", scope: !16, file: !16, line: 107, type: !17, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 109, column: 5, scope: !47)
!49 = !DILocation(line: 110, column: 5, scope: !47)
!50 = !DILocation(line: 111, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 123, type: !52, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 123, type: !7)
!58 = !DILocation(line: 123, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 123, type: !54)
!60 = !DILocation(line: 123, column: 27, scope: !51)
!61 = !DILocation(line: 126, column: 22, scope: !51)
!62 = !DILocation(line: 126, column: 12, scope: !51)
!63 = !DILocation(line: 126, column: 5, scope: !51)
!64 = !DILocation(line: 128, column: 5, scope: !51)
!65 = !DILocation(line: 129, column: 5, scope: !51)
!66 = !DILocation(line: 130, column: 5, scope: !51)
!67 = !DILocation(line: 133, column: 5, scope: !51)
!68 = !DILocation(line: 134, column: 5, scope: !51)
!69 = !DILocation(line: 135, column: 5, scope: !51)
!70 = !DILocation(line: 137, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !16, line: 56, type: !4)
!73 = !DILocation(line: 56, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !16, line: 57, type: !4)
!75 = !DILocation(line: 57, column: 15, scope: !71)
!76 = !DILocation(line: 57, column: 39, scope: !71)
!77 = !DILocation(line: 57, column: 28, scope: !71)
!78 = !DILocation(line: 58, column: 12, scope: !71)
!79 = !DILocation(line: 58, column: 10, scope: !71)
!80 = !DILocation(line: 67, column: 17, scope: !71)
!81 = !DILocation(line: 67, column: 9, scope: !71)
!82 = !DILocation(line: 68, column: 9, scope: !71)
!83 = !DILocation(line: 68, column: 20, scope: !71)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !16, line: 72, type: !33)
!85 = distinct !DILexicalBlock(scope: !71, file: !16, line: 71, column: 5)
!86 = !DILocation(line: 72, column: 17, scope: !85)
!87 = !DILocation(line: 74, column: 9, scope: !85)
!88 = !DILocation(line: 74, column: 22, scope: !85)
!89 = !DILocation(line: 74, column: 35, scope: !85)
!90 = !DILocation(line: 74, column: 28, scope: !85)
!91 = !DILocation(line: 74, column: 40, scope: !85)
!92 = !DILocation(line: 75, column: 9, scope: !85)
!93 = !DILocation(line: 75, column: 20, scope: !85)
!94 = !DILocation(line: 76, column: 20, scope: !85)
!95 = !DILocation(line: 76, column: 9, scope: !85)
!96 = !DILocation(line: 78, column: 1, scope: !71)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 83, type: !4)
!99 = !DILocation(line: 83, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !16, line: 84, type: !4)
!101 = !DILocation(line: 84, column: 15, scope: !97)
!102 = !DILocation(line: 84, column: 39, scope: !97)
!103 = !DILocation(line: 84, column: 28, scope: !97)
!104 = !DILocation(line: 85, column: 12, scope: !97)
!105 = !DILocation(line: 85, column: 10, scope: !97)
!106 = !DILocation(line: 90, column: 17, scope: !97)
!107 = !DILocation(line: 90, column: 9, scope: !97)
!108 = !DILocation(line: 91, column: 9, scope: !97)
!109 = !DILocation(line: 91, column: 20, scope: !97)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !16, line: 99, type: !33)
!111 = distinct !DILexicalBlock(scope: !97, file: !16, line: 98, column: 5)
!112 = !DILocation(line: 99, column: 17, scope: !111)
!113 = !DILocation(line: 101, column: 9, scope: !111)
!114 = !DILocation(line: 101, column: 22, scope: !111)
!115 = !DILocation(line: 101, column: 35, scope: !111)
!116 = !DILocation(line: 101, column: 28, scope: !111)
!117 = !DILocation(line: 101, column: 40, scope: !111)
!118 = !DILocation(line: 102, column: 9, scope: !111)
!119 = !DILocation(line: 102, column: 20, scope: !111)
!120 = !DILocation(line: 103, column: 20, scope: !111)
!121 = !DILocation(line: 103, column: 9, scope: !111)
!122 = !DILocation(line: 105, column: 1, scope: !97)
