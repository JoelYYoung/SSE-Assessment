; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
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
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %5, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %6, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx3, align 4, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !49
  %8 = load i32*, i32** %data1, align 8, !dbg !50
  %9 = bitcast i32* %8 to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 400, i1 false), !dbg !49
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx5, align 4, !dbg !52
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  call void @printWLine(i32* %arraydecay6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !87
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  store i32* %4, i32** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !92, metadata !DIExpression()), !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %5, i32** %dataCopy, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !96, metadata !DIExpression()), !dbg !97
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !98
  store i32* %6, i32** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !106
  %8 = load i32*, i32** %data1, align 8, !dbg !107
  %9 = bitcast i32* %8 to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 400, i1 false), !dbg !106
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx5, align 4, !dbg !109
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  call void @printWLine(i32* %arraydecay6), !dbg !111
  ret void, !dbg !112
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 30, column: 12, scope: !15)
!30 = !DILocation(line: 30, column: 23, scope: !15)
!31 = !DILocation(line: 30, column: 10, scope: !15)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !16, line: 32, type: !4)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 19, scope: !33)
!35 = !DILocation(line: 32, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 33, type: !4)
!37 = !DILocation(line: 33, column: 19, scope: !33)
!38 = !DILocation(line: 33, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !16, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !16, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 21, scope: !40)
!45 = !DILocation(line: 36, column: 21, scope: !40)
!46 = !DILocation(line: 36, column: 13, scope: !40)
!47 = !DILocation(line: 37, column: 13, scope: !40)
!48 = !DILocation(line: 37, column: 25, scope: !40)
!49 = !DILocation(line: 39, column: 13, scope: !40)
!50 = !DILocation(line: 39, column: 26, scope: !40)
!51 = !DILocation(line: 41, column: 13, scope: !40)
!52 = !DILocation(line: 41, column: 25, scope: !40)
!53 = !DILocation(line: 42, column: 24, scope: !40)
!54 = !DILocation(line: 42, column: 13, scope: !40)
!55 = !DILocation(line: 45, column: 1, scope: !15)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memcpy_31_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 78, column: 5, scope: !56)
!58 = !DILocation(line: 79, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 90, type: !60, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 90, type: !7)
!66 = !DILocation(line: 90, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 90, type: !62)
!68 = !DILocation(line: 90, column: 27, scope: !59)
!69 = !DILocation(line: 93, column: 22, scope: !59)
!70 = !DILocation(line: 93, column: 12, scope: !59)
!71 = !DILocation(line: 93, column: 5, scope: !59)
!72 = !DILocation(line: 95, column: 5, scope: !59)
!73 = !DILocation(line: 96, column: 5, scope: !59)
!74 = !DILocation(line: 97, column: 5, scope: !59)
!75 = !DILocation(line: 100, column: 5, scope: !59)
!76 = !DILocation(line: 101, column: 5, scope: !59)
!77 = !DILocation(line: 102, column: 5, scope: !59)
!78 = !DILocation(line: 104, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !16, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !16, line: 55, type: !4)
!83 = !DILocation(line: 55, column: 15, scope: !79)
!84 = !DILocation(line: 55, column: 39, scope: !79)
!85 = !DILocation(line: 55, column: 28, scope: !79)
!86 = !DILocation(line: 56, column: 13, scope: !79)
!87 = !DILocation(line: 56, column: 5, scope: !79)
!88 = !DILocation(line: 57, column: 5, scope: !79)
!89 = !DILocation(line: 57, column: 23, scope: !79)
!90 = !DILocation(line: 59, column: 12, scope: !79)
!91 = !DILocation(line: 59, column: 10, scope: !79)
!92 = !DILocalVariable(name: "dataCopy", scope: !93, file: !16, line: 61, type: !4)
!93 = distinct !DILexicalBlock(scope: !79, file: !16, line: 60, column: 5)
!94 = !DILocation(line: 61, column: 19, scope: !93)
!95 = !DILocation(line: 61, column: 30, scope: !93)
!96 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 62, type: !4)
!97 = !DILocation(line: 62, column: 19, scope: !93)
!98 = !DILocation(line: 62, column: 26, scope: !93)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !16, line: 64, type: !41)
!100 = distinct !DILexicalBlock(scope: !93, file: !16, line: 63, column: 9)
!101 = !DILocation(line: 64, column: 21, scope: !100)
!102 = !DILocation(line: 65, column: 21, scope: !100)
!103 = !DILocation(line: 65, column: 13, scope: !100)
!104 = !DILocation(line: 66, column: 13, scope: !100)
!105 = !DILocation(line: 66, column: 25, scope: !100)
!106 = !DILocation(line: 68, column: 13, scope: !100)
!107 = !DILocation(line: 68, column: 26, scope: !100)
!108 = !DILocation(line: 70, column: 13, scope: !100)
!109 = !DILocation(line: 70, column: 25, scope: !100)
!110 = !DILocation(line: 71, column: 24, scope: !100)
!111 = !DILocation(line: 71, column: 13, scope: !100)
!112 = !DILocation(line: 74, column: 1, scope: !79)
