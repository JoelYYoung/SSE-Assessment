; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
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
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %6 = bitcast i32* %5 to i8*, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %7 = bitcast i32* %arraydecay3 to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !44
  store i32 0, i32* %arrayidx4, align 4, !dbg !45
  %9 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %9), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 400, align 16, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %dataBuffer, align 8, !dbg !77
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !81
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  store i32* %4, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !89
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !90
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx2, align 4, !dbg !92
  %5 = load i32*, i32** %data, align 8, !dbg !93
  %6 = bitcast i32* %5 to i8*, !dbg !94
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !94
  %7 = bitcast i32* %arraydecay3 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !94
  %8 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !95
  store i32 0, i32* %arrayidx4, align 4, !dbg !96
  %9 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %9), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBuffer, align 8, !dbg !104
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !108
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx2, align 4, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %6 = bitcast i32* %5 to i8*, !dbg !121
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %7 = bitcast i32* %arraydecay3 to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !121
  %8 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !122
  store i32 0, i32* %arrayidx4, align 4, !dbg !123
  %9 = load i32*, i32** %data, align 8, !dbg !124
  call void @printWLine(i32* %9), !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 33, column: 16, scope: !15)
!30 = !DILocation(line: 33, column: 27, scope: !15)
!31 = !DILocation(line: 33, column: 14, scope: !15)
!32 = !DILocalVariable(name: "source", scope: !33, file: !16, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 41, column: 17, scope: !33)
!38 = !DILocation(line: 42, column: 17, scope: !33)
!39 = !DILocation(line: 42, column: 9, scope: !33)
!40 = !DILocation(line: 43, column: 9, scope: !33)
!41 = !DILocation(line: 43, column: 23, scope: !33)
!42 = !DILocation(line: 45, column: 16, scope: !33)
!43 = !DILocation(line: 45, column: 9, scope: !33)
!44 = !DILocation(line: 47, column: 9, scope: !33)
!45 = !DILocation(line: 47, column: 21, scope: !33)
!46 = !DILocation(line: 48, column: 20, scope: !33)
!47 = !DILocation(line: 48, column: 9, scope: !33)
!48 = !DILocation(line: 50, column: 1, scope: !15)
!49 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_memcpy_15_good", scope: !16, file: !16, line: 116, type: !17, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 118, column: 5, scope: !49)
!51 = !DILocation(line: 119, column: 5, scope: !49)
!52 = !DILocation(line: 120, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 132, type: !54, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !16, line: 132, type: !7)
!60 = !DILocation(line: 132, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !16, line: 132, type: !56)
!62 = !DILocation(line: 132, column: 27, scope: !53)
!63 = !DILocation(line: 135, column: 22, scope: !53)
!64 = !DILocation(line: 135, column: 12, scope: !53)
!65 = !DILocation(line: 135, column: 5, scope: !53)
!66 = !DILocation(line: 137, column: 5, scope: !53)
!67 = !DILocation(line: 138, column: 5, scope: !53)
!68 = !DILocation(line: 139, column: 5, scope: !53)
!69 = !DILocation(line: 142, column: 5, scope: !53)
!70 = !DILocation(line: 143, column: 5, scope: !53)
!71 = !DILocation(line: 144, column: 5, scope: !53)
!72 = !DILocation(line: 146, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !16, line: 59, type: !4)
!75 = !DILocation(line: 59, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !16, line: 60, type: !4)
!77 = !DILocation(line: 60, column: 15, scope: !73)
!78 = !DILocation(line: 60, column: 39, scope: !73)
!79 = !DILocation(line: 60, column: 28, scope: !73)
!80 = !DILocation(line: 61, column: 13, scope: !73)
!81 = !DILocation(line: 61, column: 5, scope: !73)
!82 = !DILocation(line: 62, column: 5, scope: !73)
!83 = !DILocation(line: 62, column: 23, scope: !73)
!84 = !DILocation(line: 71, column: 16, scope: !73)
!85 = !DILocation(line: 71, column: 14, scope: !73)
!86 = !DILocalVariable(name: "source", scope: !87, file: !16, line: 75, type: !34)
!87 = distinct !DILexicalBlock(scope: !73, file: !16, line: 74, column: 5)
!88 = !DILocation(line: 75, column: 17, scope: !87)
!89 = !DILocation(line: 76, column: 17, scope: !87)
!90 = !DILocation(line: 76, column: 9, scope: !87)
!91 = !DILocation(line: 77, column: 9, scope: !87)
!92 = !DILocation(line: 77, column: 23, scope: !87)
!93 = !DILocation(line: 79, column: 16, scope: !87)
!94 = !DILocation(line: 79, column: 9, scope: !87)
!95 = !DILocation(line: 81, column: 9, scope: !87)
!96 = !DILocation(line: 81, column: 21, scope: !87)
!97 = !DILocation(line: 82, column: 20, scope: !87)
!98 = !DILocation(line: 82, column: 9, scope: !87)
!99 = !DILocation(line: 84, column: 1, scope: !73)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 89, type: !4)
!102 = !DILocation(line: 89, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !16, line: 90, type: !4)
!104 = !DILocation(line: 90, column: 15, scope: !100)
!105 = !DILocation(line: 90, column: 39, scope: !100)
!106 = !DILocation(line: 90, column: 28, scope: !100)
!107 = !DILocation(line: 91, column: 13, scope: !100)
!108 = !DILocation(line: 91, column: 5, scope: !100)
!109 = !DILocation(line: 92, column: 5, scope: !100)
!110 = !DILocation(line: 92, column: 23, scope: !100)
!111 = !DILocation(line: 97, column: 16, scope: !100)
!112 = !DILocation(line: 97, column: 14, scope: !100)
!113 = !DILocalVariable(name: "source", scope: !114, file: !16, line: 105, type: !34)
!114 = distinct !DILexicalBlock(scope: !100, file: !16, line: 104, column: 5)
!115 = !DILocation(line: 105, column: 17, scope: !114)
!116 = !DILocation(line: 106, column: 17, scope: !114)
!117 = !DILocation(line: 106, column: 9, scope: !114)
!118 = !DILocation(line: 107, column: 9, scope: !114)
!119 = !DILocation(line: 107, column: 23, scope: !114)
!120 = !DILocation(line: 109, column: 16, scope: !114)
!121 = !DILocation(line: 109, column: 9, scope: !114)
!122 = !DILocation(line: 111, column: 9, scope: !114)
!123 = !DILocation(line: 111, column: 21, scope: !114)
!124 = !DILocation(line: 112, column: 20, scope: !114)
!125 = !DILocation(line: 112, column: 9, scope: !114)
!126 = !DILocation(line: 114, column: 1, scope: !100)
