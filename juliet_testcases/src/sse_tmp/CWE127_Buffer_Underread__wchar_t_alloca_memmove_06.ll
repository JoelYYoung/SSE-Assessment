; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_06_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !32
  store i32* %add.ptr, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %7 = bitcast i32* %6 to i8*, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 400, i1 false), !dbg !44
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx4, align 4, !dbg !47
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  call void @printWLine(i32* %arraydecay5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_06_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_06_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_06_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 400, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBuffer, align 8, !dbg !79
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !83
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  store i32* %4, i32** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !94
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx2, align 4, !dbg !96
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !97
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !97
  %6 = load i32*, i32** %data, align 8, !dbg !98
  %7 = bitcast i32* %6 to i8*, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 400, i1 false), !dbg !97
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx4, align 4, !dbg !100
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  call void @printWLine(i32* %arraydecay5), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !112
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  store i32* %4, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx2, align 4, !dbg !125
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !126
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %7 = bitcast i32* %6 to i8*, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 400, i1 false), !dbg !126
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx4, align 4, !dbg !129
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay5), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memmove_06_bad", scope: !16, file: !16, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_06.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 30, type: !4)
!22 = !DILocation(line: 30, column: 15, scope: !15)
!23 = !DILocation(line: 30, column: 39, scope: !15)
!24 = !DILocation(line: 30, column: 28, scope: !15)
!25 = !DILocation(line: 31, column: 13, scope: !15)
!26 = !DILocation(line: 31, column: 5, scope: !15)
!27 = !DILocation(line: 32, column: 5, scope: !15)
!28 = !DILocation(line: 32, column: 23, scope: !15)
!29 = !DILocation(line: 36, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 34, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!32 = !DILocation(line: 36, column: 27, scope: !30)
!33 = !DILocation(line: 36, column: 14, scope: !30)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 39, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 39, column: 17, scope: !35)
!40 = !DILocation(line: 40, column: 17, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 41, column: 9, scope: !35)
!43 = !DILocation(line: 41, column: 21, scope: !35)
!44 = !DILocation(line: 43, column: 9, scope: !35)
!45 = !DILocation(line: 43, column: 23, scope: !35)
!46 = !DILocation(line: 45, column: 9, scope: !35)
!47 = !DILocation(line: 45, column: 21, scope: !35)
!48 = !DILocation(line: 46, column: 20, scope: !35)
!49 = !DILocation(line: 46, column: 9, scope: !35)
!50 = !DILocation(line: 48, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memmove_06_good", scope: !16, file: !16, line: 107, type: !17, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 109, column: 5, scope: !51)
!53 = !DILocation(line: 110, column: 5, scope: !51)
!54 = !DILocation(line: 111, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 123, type: !56, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !16, line: 123, type: !7)
!62 = !DILocation(line: 123, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !16, line: 123, type: !58)
!64 = !DILocation(line: 123, column: 27, scope: !55)
!65 = !DILocation(line: 126, column: 22, scope: !55)
!66 = !DILocation(line: 126, column: 12, scope: !55)
!67 = !DILocation(line: 126, column: 5, scope: !55)
!68 = !DILocation(line: 128, column: 5, scope: !55)
!69 = !DILocation(line: 129, column: 5, scope: !55)
!70 = !DILocation(line: 130, column: 5, scope: !55)
!71 = !DILocation(line: 133, column: 5, scope: !55)
!72 = !DILocation(line: 134, column: 5, scope: !55)
!73 = !DILocation(line: 135, column: 5, scope: !55)
!74 = !DILocation(line: 137, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !16, line: 57, type: !4)
!77 = !DILocation(line: 57, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !16, line: 58, type: !4)
!79 = !DILocation(line: 58, column: 15, scope: !75)
!80 = !DILocation(line: 58, column: 39, scope: !75)
!81 = !DILocation(line: 58, column: 28, scope: !75)
!82 = !DILocation(line: 59, column: 13, scope: !75)
!83 = !DILocation(line: 59, column: 5, scope: !75)
!84 = !DILocation(line: 60, column: 5, scope: !75)
!85 = !DILocation(line: 60, column: 23, scope: !75)
!86 = !DILocation(line: 69, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !16, line: 67, column: 5)
!88 = distinct !DILexicalBlock(scope: !75, file: !16, line: 61, column: 8)
!89 = !DILocation(line: 69, column: 14, scope: !87)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !16, line: 72, type: !36)
!91 = distinct !DILexicalBlock(scope: !75, file: !16, line: 71, column: 5)
!92 = !DILocation(line: 72, column: 17, scope: !91)
!93 = !DILocation(line: 73, column: 17, scope: !91)
!94 = !DILocation(line: 73, column: 9, scope: !91)
!95 = !DILocation(line: 74, column: 9, scope: !91)
!96 = !DILocation(line: 74, column: 21, scope: !91)
!97 = !DILocation(line: 76, column: 9, scope: !91)
!98 = !DILocation(line: 76, column: 23, scope: !91)
!99 = !DILocation(line: 78, column: 9, scope: !91)
!100 = !DILocation(line: 78, column: 21, scope: !91)
!101 = !DILocation(line: 79, column: 20, scope: !91)
!102 = !DILocation(line: 79, column: 9, scope: !91)
!103 = !DILocation(line: 81, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 86, type: !4)
!106 = !DILocation(line: 86, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !16, line: 87, type: !4)
!108 = !DILocation(line: 87, column: 15, scope: !104)
!109 = !DILocation(line: 87, column: 39, scope: !104)
!110 = !DILocation(line: 87, column: 28, scope: !104)
!111 = !DILocation(line: 88, column: 13, scope: !104)
!112 = !DILocation(line: 88, column: 5, scope: !104)
!113 = !DILocation(line: 89, column: 5, scope: !104)
!114 = !DILocation(line: 89, column: 23, scope: !104)
!115 = !DILocation(line: 93, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !16, line: 91, column: 5)
!117 = distinct !DILexicalBlock(scope: !104, file: !16, line: 90, column: 8)
!118 = !DILocation(line: 93, column: 14, scope: !116)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !16, line: 96, type: !36)
!120 = distinct !DILexicalBlock(scope: !104, file: !16, line: 95, column: 5)
!121 = !DILocation(line: 96, column: 17, scope: !120)
!122 = !DILocation(line: 97, column: 17, scope: !120)
!123 = !DILocation(line: 97, column: 9, scope: !120)
!124 = !DILocation(line: 98, column: 9, scope: !120)
!125 = !DILocation(line: 98, column: 21, scope: !120)
!126 = !DILocation(line: 100, column: 9, scope: !120)
!127 = !DILocation(line: 100, column: 23, scope: !120)
!128 = !DILocation(line: 102, column: 9, scope: !120)
!129 = !DILocation(line: 102, column: 21, scope: !120)
!130 = !DILocation(line: 103, column: 20, scope: !120)
!131 = !DILocation(line: 103, column: 9, scope: !120)
!132 = !DILocation(line: 105, column: 1, scope: !104)
