; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42_bad() #0 !dbg !15 {
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
  %call = call i32* @badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !36
  %5 = bitcast i32* %arraydecay to i8*, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  %7 = bitcast i32* %6 to i8*, !dbg !36
  %8 = load i32*, i32** %data, align 8, !dbg !38
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !39
  %mul = mul i64 %call1, 4, !dbg !40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %9 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %9), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32*, i32** %data.addr, align 8, !dbg !51
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #8, !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %2 = load i32*, i32** %data.addr, align 8, !dbg !55
  ret i32* %2, !dbg !56
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #8, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #8, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 400, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBuffer, align 8, !dbg !84
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  store i32* %2, i32** %data, align 8, !dbg !88
  %3 = load i32*, i32** %data, align 8, !dbg !89
  %call = call i32* @goodG2BSource(i32* %3), !dbg !90
  store i32* %call, i32** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !95
  %5 = bitcast i32* %arraydecay to i8*, !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %7 = bitcast i32* %6 to i8*, !dbg !95
  %8 = load i32*, i32** %data, align 8, !dbg !97
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !98
  %mul = mul i64 %call1, 4, !dbg !99
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %9 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %9), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !105 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32*, i32** %data.addr, align 8, !dbg !108
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #8, !dbg !109
  %1 = load i32*, i32** %data.addr, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %2 = load i32*, i32** %data.addr, align 8, !dbg !112
  ret i32* %2, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 34, type: !4)
!22 = !DILocation(line: 34, column: 15, scope: !15)
!23 = !DILocation(line: 34, column: 39, scope: !15)
!24 = !DILocation(line: 34, column: 28, scope: !15)
!25 = !DILocation(line: 35, column: 12, scope: !15)
!26 = !DILocation(line: 35, column: 10, scope: !15)
!27 = !DILocation(line: 36, column: 22, scope: !15)
!28 = !DILocation(line: 36, column: 12, scope: !15)
!29 = !DILocation(line: 36, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 38, column: 17, scope: !31)
!36 = !DILocation(line: 40, column: 9, scope: !31)
!37 = !DILocation(line: 40, column: 23, scope: !31)
!38 = !DILocation(line: 40, column: 36, scope: !31)
!39 = !DILocation(line: 40, column: 29, scope: !31)
!40 = !DILocation(line: 40, column: 41, scope: !31)
!41 = !DILocation(line: 41, column: 9, scope: !31)
!42 = !DILocation(line: 41, column: 20, scope: !31)
!43 = !DILocation(line: 42, column: 20, scope: !31)
!44 = !DILocation(line: 42, column: 9, scope: !31)
!45 = !DILocation(line: 44, column: 1, scope: !15)
!46 = distinct !DISubprogram(name: "badSource", scope: !16, file: !16, line: 23, type: !47, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!4, !4}
!49 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !16, line: 23, type: !4)
!50 = !DILocation(line: 23, column: 38, scope: !46)
!51 = !DILocation(line: 26, column: 13, scope: !46)
!52 = !DILocation(line: 26, column: 5, scope: !46)
!53 = !DILocation(line: 27, column: 5, scope: !46)
!54 = !DILocation(line: 27, column: 17, scope: !46)
!55 = !DILocation(line: 28, column: 12, scope: !46)
!56 = !DILocation(line: 28, column: 5, scope: !46)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_42_good", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 76, column: 5, scope: !57)
!59 = !DILocation(line: 77, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 89, type: !61, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !16, line: 89, type: !7)
!67 = !DILocation(line: 89, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !16, line: 89, type: !63)
!69 = !DILocation(line: 89, column: 27, scope: !60)
!70 = !DILocation(line: 92, column: 22, scope: !60)
!71 = !DILocation(line: 92, column: 12, scope: !60)
!72 = !DILocation(line: 92, column: 5, scope: !60)
!73 = !DILocation(line: 94, column: 5, scope: !60)
!74 = !DILocation(line: 95, column: 5, scope: !60)
!75 = !DILocation(line: 96, column: 5, scope: !60)
!76 = !DILocation(line: 99, column: 5, scope: !60)
!77 = !DILocation(line: 100, column: 5, scope: !60)
!78 = !DILocation(line: 101, column: 5, scope: !60)
!79 = !DILocation(line: 103, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 61, type: !4)
!82 = !DILocation(line: 61, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !16, line: 62, type: !4)
!84 = !DILocation(line: 62, column: 15, scope: !80)
!85 = !DILocation(line: 62, column: 39, scope: !80)
!86 = !DILocation(line: 62, column: 28, scope: !80)
!87 = !DILocation(line: 63, column: 12, scope: !80)
!88 = !DILocation(line: 63, column: 10, scope: !80)
!89 = !DILocation(line: 64, column: 26, scope: !80)
!90 = !DILocation(line: 64, column: 12, scope: !80)
!91 = !DILocation(line: 64, column: 10, scope: !80)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !16, line: 66, type: !32)
!93 = distinct !DILexicalBlock(scope: !80, file: !16, line: 65, column: 5)
!94 = !DILocation(line: 66, column: 17, scope: !93)
!95 = !DILocation(line: 68, column: 9, scope: !93)
!96 = !DILocation(line: 68, column: 23, scope: !93)
!97 = !DILocation(line: 68, column: 36, scope: !93)
!98 = !DILocation(line: 68, column: 29, scope: !93)
!99 = !DILocation(line: 68, column: 41, scope: !93)
!100 = !DILocation(line: 69, column: 9, scope: !93)
!101 = !DILocation(line: 69, column: 20, scope: !93)
!102 = !DILocation(line: 70, column: 20, scope: !93)
!103 = !DILocation(line: 70, column: 9, scope: !93)
!104 = !DILocation(line: 72, column: 1, scope: !80)
!105 = distinct !DISubprogram(name: "goodG2BSource", scope: !16, file: !16, line: 50, type: !47, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", arg: 1, scope: !105, file: !16, line: 50, type: !4)
!107 = !DILocation(line: 50, column: 42, scope: !105)
!108 = !DILocation(line: 53, column: 13, scope: !105)
!109 = !DILocation(line: 53, column: 5, scope: !105)
!110 = !DILocation(line: 54, column: 5, scope: !105)
!111 = !DILocation(line: 54, column: 16, scope: !105)
!112 = !DILocation(line: 55, column: 12, scope: !105)
!113 = !DILocation(line: 55, column: 5, scope: !105)
