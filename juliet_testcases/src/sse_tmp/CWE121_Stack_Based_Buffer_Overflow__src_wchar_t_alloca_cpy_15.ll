; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_bad() #0 !dbg !15 {
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
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !39
  %7 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* %7), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 400, align 16, !dbg !72
  %1 = bitcast i8* %0 to i32*, !dbg !73
  store i32* %1, i32** %dataBuffer, align 8, !dbg !71
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  store i32* %2, i32** %data, align 8, !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !77
  %4 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !82
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !85
  %7 = load i32*, i32** %data, align 8, !dbg !86
  call void @printWLine(i32* %7), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 400, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBuffer, align 8, !dbg !93
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  store i32* %2, i32** %data, align 8, !dbg !97
  %3 = load i32*, i32** %data, align 8, !dbg !98
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !107
  %7 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %7), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15.c", directory: "/root/SSE-Assessment")
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
!37 = !DILocation(line: 43, column: 16, scope: !32)
!38 = !DILocation(line: 43, column: 22, scope: !32)
!39 = !DILocation(line: 43, column: 9, scope: !32)
!40 = !DILocation(line: 44, column: 20, scope: !32)
!41 = !DILocation(line: 44, column: 9, scope: !32)
!42 = !DILocation(line: 46, column: 1, scope: !15)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_good", scope: !16, file: !16, line: 104, type: !17, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 106, column: 5, scope: !43)
!45 = !DILocation(line: 107, column: 5, scope: !43)
!46 = !DILocation(line: 108, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 120, type: !48, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!7, !7, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !16, line: 120, type: !7)
!54 = !DILocation(line: 120, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !16, line: 120, type: !50)
!56 = !DILocation(line: 120, column: 27, scope: !47)
!57 = !DILocation(line: 123, column: 22, scope: !47)
!58 = !DILocation(line: 123, column: 12, scope: !47)
!59 = !DILocation(line: 123, column: 5, scope: !47)
!60 = !DILocation(line: 125, column: 5, scope: !47)
!61 = !DILocation(line: 126, column: 5, scope: !47)
!62 = !DILocation(line: 127, column: 5, scope: !47)
!63 = !DILocation(line: 130, column: 5, scope: !47)
!64 = !DILocation(line: 131, column: 5, scope: !47)
!65 = !DILocation(line: 132, column: 5, scope: !47)
!66 = !DILocation(line: 134, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !16, line: 55, type: !4)
!69 = !DILocation(line: 55, column: 15, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !16, line: 56, type: !4)
!71 = !DILocation(line: 56, column: 15, scope: !67)
!72 = !DILocation(line: 56, column: 39, scope: !67)
!73 = !DILocation(line: 56, column: 28, scope: !67)
!74 = !DILocation(line: 57, column: 12, scope: !67)
!75 = !DILocation(line: 57, column: 10, scope: !67)
!76 = !DILocation(line: 66, column: 17, scope: !67)
!77 = !DILocation(line: 66, column: 9, scope: !67)
!78 = !DILocation(line: 67, column: 9, scope: !67)
!79 = !DILocation(line: 67, column: 20, scope: !67)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !16, line: 71, type: !33)
!81 = distinct !DILexicalBlock(scope: !67, file: !16, line: 70, column: 5)
!82 = !DILocation(line: 71, column: 17, scope: !81)
!83 = !DILocation(line: 73, column: 16, scope: !81)
!84 = !DILocation(line: 73, column: 22, scope: !81)
!85 = !DILocation(line: 73, column: 9, scope: !81)
!86 = !DILocation(line: 74, column: 20, scope: !81)
!87 = !DILocation(line: 74, column: 9, scope: !81)
!88 = !DILocation(line: 76, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !16, line: 81, type: !4)
!91 = !DILocation(line: 81, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !16, line: 82, type: !4)
!93 = !DILocation(line: 82, column: 15, scope: !89)
!94 = !DILocation(line: 82, column: 39, scope: !89)
!95 = !DILocation(line: 82, column: 28, scope: !89)
!96 = !DILocation(line: 83, column: 12, scope: !89)
!97 = !DILocation(line: 83, column: 10, scope: !89)
!98 = !DILocation(line: 88, column: 17, scope: !89)
!99 = !DILocation(line: 88, column: 9, scope: !89)
!100 = !DILocation(line: 89, column: 9, scope: !89)
!101 = !DILocation(line: 89, column: 20, scope: !89)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !16, line: 97, type: !33)
!103 = distinct !DILexicalBlock(scope: !89, file: !16, line: 96, column: 5)
!104 = !DILocation(line: 97, column: 17, scope: !103)
!105 = !DILocation(line: 99, column: 16, scope: !103)
!106 = !DILocation(line: 99, column: 22, scope: !103)
!107 = !DILocation(line: 99, column: 9, scope: !103)
!108 = !DILocation(line: 100, column: 20, scope: !103)
!109 = !DILocation(line: 100, column: 9, scope: !103)
!110 = !DILocation(line: 102, column: 1, scope: !89)
