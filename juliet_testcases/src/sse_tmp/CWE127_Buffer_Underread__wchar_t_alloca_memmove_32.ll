; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data1, align 8, !dbg !41
  %7 = load i32*, i32** %data1, align 8, !dbg !42
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %7, i32** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %10 = load i32*, i32** %9, align 8, !dbg !49
  store i32* %10, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %11 = bitcast i32* %arraydecay5 to i8*, !dbg !60
  %12 = load i32*, i32** %data2, align 8, !dbg !61
  %13 = bitcast i32* %12 to i8*, !dbg !60
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 400, i1 false), !dbg !60
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx6, align 4, !dbg !63
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay7), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_32_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memmove_32_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBuffer, align 8, !dbg !98
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !102
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !108
  %5 = load i32*, i32** %4, align 8, !dbg !109
  store i32* %5, i32** %data1, align 8, !dbg !107
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  store i32* %6, i32** %data1, align 8, !dbg !111
  %7 = load i32*, i32** %data1, align 8, !dbg !112
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !113
  store i32* %7, i32** %8, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !115, metadata !DIExpression()), !dbg !117
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !118
  %10 = load i32*, i32** %9, align 8, !dbg !119
  store i32* %10, i32** %data2, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !124
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx4, align 4, !dbg !126
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %11 = bitcast i32* %arraydecay5 to i8*, !dbg !127
  %12 = load i32*, i32** %data2, align 8, !dbg !128
  %13 = bitcast i32* %12 to i8*, !dbg !127
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 400, i1 false), !dbg !127
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx6, align 4, !dbg !130
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  call void @printWLine(i32* %arraydecay7), !dbg !132
  ret void, !dbg !133
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memmove_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 39, scope: !15)
!29 = !DILocation(line: 28, column: 28, scope: !15)
!30 = !DILocation(line: 29, column: 13, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 30, column: 5, scope: !15)
!33 = !DILocation(line: 30, column: 23, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 27, scope: !35)
!38 = !DILocation(line: 32, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 27, scope: !35)
!41 = !DILocation(line: 34, column: 14, scope: !35)
!42 = !DILocation(line: 35, column: 21, scope: !35)
!43 = !DILocation(line: 35, column: 10, scope: !35)
!44 = !DILocation(line: 35, column: 19, scope: !35)
!45 = !DILocalVariable(name: "data", scope: !46, file: !16, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 27, scope: !46)
!49 = !DILocation(line: 38, column: 26, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !16, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 21, scope: !51)
!56 = !DILocation(line: 41, column: 21, scope: !51)
!57 = !DILocation(line: 41, column: 13, scope: !51)
!58 = !DILocation(line: 42, column: 13, scope: !51)
!59 = !DILocation(line: 42, column: 25, scope: !51)
!60 = !DILocation(line: 44, column: 13, scope: !51)
!61 = !DILocation(line: 44, column: 27, scope: !51)
!62 = !DILocation(line: 46, column: 13, scope: !51)
!63 = !DILocation(line: 46, column: 25, scope: !51)
!64 = !DILocation(line: 47, column: 24, scope: !51)
!65 = !DILocation(line: 47, column: 13, scope: !51)
!66 = !DILocation(line: 50, column: 1, scope: !15)
!67 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memmove_32_good", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 88, column: 5, scope: !67)
!69 = !DILocation(line: 89, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !71, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !16, line: 100, type: !7)
!77 = !DILocation(line: 100, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !16, line: 100, type: !73)
!79 = !DILocation(line: 100, column: 27, scope: !70)
!80 = !DILocation(line: 103, column: 22, scope: !70)
!81 = !DILocation(line: 103, column: 12, scope: !70)
!82 = !DILocation(line: 103, column: 5, scope: !70)
!83 = !DILocation(line: 105, column: 5, scope: !70)
!84 = !DILocation(line: 106, column: 5, scope: !70)
!85 = !DILocation(line: 107, column: 5, scope: !70)
!86 = !DILocation(line: 110, column: 5, scope: !70)
!87 = !DILocation(line: 111, column: 5, scope: !70)
!88 = !DILocation(line: 112, column: 5, scope: !70)
!89 = !DILocation(line: 114, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !16, line: 59, type: !4)
!92 = !DILocation(line: 59, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !16, line: 60, type: !22)
!94 = !DILocation(line: 60, column: 16, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !16, line: 61, type: !22)
!96 = !DILocation(line: 61, column: 16, scope: !90)
!97 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !16, line: 62, type: !4)
!98 = !DILocation(line: 62, column: 15, scope: !90)
!99 = !DILocation(line: 62, column: 39, scope: !90)
!100 = !DILocation(line: 62, column: 28, scope: !90)
!101 = !DILocation(line: 63, column: 13, scope: !90)
!102 = !DILocation(line: 63, column: 5, scope: !90)
!103 = !DILocation(line: 64, column: 5, scope: !90)
!104 = !DILocation(line: 64, column: 23, scope: !90)
!105 = !DILocalVariable(name: "data", scope: !106, file: !16, line: 66, type: !4)
!106 = distinct !DILexicalBlock(scope: !90, file: !16, line: 65, column: 5)
!107 = !DILocation(line: 66, column: 19, scope: !106)
!108 = !DILocation(line: 66, column: 27, scope: !106)
!109 = !DILocation(line: 66, column: 26, scope: !106)
!110 = !DILocation(line: 68, column: 16, scope: !106)
!111 = !DILocation(line: 68, column: 14, scope: !106)
!112 = !DILocation(line: 69, column: 21, scope: !106)
!113 = !DILocation(line: 69, column: 10, scope: !106)
!114 = !DILocation(line: 69, column: 19, scope: !106)
!115 = !DILocalVariable(name: "data", scope: !116, file: !16, line: 72, type: !4)
!116 = distinct !DILexicalBlock(scope: !90, file: !16, line: 71, column: 5)
!117 = !DILocation(line: 72, column: 19, scope: !116)
!118 = !DILocation(line: 72, column: 27, scope: !116)
!119 = !DILocation(line: 72, column: 26, scope: !116)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !16, line: 74, type: !52)
!121 = distinct !DILexicalBlock(scope: !116, file: !16, line: 73, column: 9)
!122 = !DILocation(line: 74, column: 21, scope: !121)
!123 = !DILocation(line: 75, column: 21, scope: !121)
!124 = !DILocation(line: 75, column: 13, scope: !121)
!125 = !DILocation(line: 76, column: 13, scope: !121)
!126 = !DILocation(line: 76, column: 25, scope: !121)
!127 = !DILocation(line: 78, column: 13, scope: !121)
!128 = !DILocation(line: 78, column: 27, scope: !121)
!129 = !DILocation(line: 80, column: 13, scope: !121)
!130 = !DILocation(line: 80, column: 25, scope: !121)
!131 = !DILocation(line: 81, column: 24, scope: !121)
!132 = !DILocation(line: 81, column: 13, scope: !121)
!133 = !DILocation(line: 84, column: 1, scope: !90)
