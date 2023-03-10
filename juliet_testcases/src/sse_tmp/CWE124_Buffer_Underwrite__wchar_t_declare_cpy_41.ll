; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call2 = call i32* @wcscpy(i32* %0, i32* %arraydecay1) #4, !dbg !33
  %1 = load i32*, i32** %data.addr, align 8, !dbg !34
  call void @printWLine(i32* %1), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !48
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !49
  store i32* %add.ptr, i32** %data, align 8, !dbg !50
  %0 = load i32*, i32** %data, align 8, !dbg !51
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_badSink(i32* %0), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_goodG2BSink(i32* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !57, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !61
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  %0 = load i32*, i32** %data.addr, align 8, !dbg !64
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call2 = call i32* @wcscpy(i32* %0, i32* %arraydecay1) #4, !dbg !66
  %1 = load i32*, i32** %data.addr, align 8, !dbg !67
  call void @printWLine(i32* %1), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #4, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #4, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !98
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !99
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i32* %arraydecay1, i32** %data, align 8, !dbg !103
  %0 = load i32*, i32** %data, align 8, !dbg !104
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_goodG2BSink(i32* %0), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 73, scope: !11)
!21 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 23, scope: !22)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 22, scope: !22)
!33 = !DILocation(line: 30, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 20, scope: !22)
!35 = !DILocation(line: 31, column: 9, scope: !22)
!36 = !DILocation(line: 33, column: 1, scope: !11)
!37 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_bad", scope: !12, file: !12, line: 35, type: !38, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 37, type: !15)
!41 = !DILocation(line: 37, column: 15, scope: !37)
!42 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !12, line: 38, type: !23)
!43 = !DILocation(line: 38, column: 13, scope: !37)
!44 = !DILocation(line: 39, column: 13, scope: !37)
!45 = !DILocation(line: 39, column: 5, scope: !37)
!46 = !DILocation(line: 40, column: 5, scope: !37)
!47 = !DILocation(line: 40, column: 23, scope: !37)
!48 = !DILocation(line: 42, column: 12, scope: !37)
!49 = !DILocation(line: 42, column: 23, scope: !37)
!50 = !DILocation(line: 42, column: 10, scope: !37)
!51 = !DILocation(line: 43, column: 62, scope: !37)
!52 = !DILocation(line: 43, column: 5, scope: !37)
!53 = !DILocation(line: 44, column: 1, scope: !37)
!54 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_goodG2BSink", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !12, line: 50, type: !15)
!56 = !DILocation(line: 50, column: 77, scope: !54)
!57 = !DILocalVariable(name: "source", scope: !58, file: !12, line: 53, type: !23)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 52, column: 5)
!59 = !DILocation(line: 53, column: 17, scope: !58)
!60 = !DILocation(line: 54, column: 17, scope: !58)
!61 = !DILocation(line: 54, column: 9, scope: !58)
!62 = !DILocation(line: 55, column: 9, scope: !58)
!63 = !DILocation(line: 55, column: 23, scope: !58)
!64 = !DILocation(line: 57, column: 16, scope: !58)
!65 = !DILocation(line: 57, column: 22, scope: !58)
!66 = !DILocation(line: 57, column: 9, scope: !58)
!67 = !DILocation(line: 58, column: 20, scope: !58)
!68 = !DILocation(line: 58, column: 9, scope: !58)
!69 = !DILocation(line: 60, column: 1, scope: !54)
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_41_good", scope: !12, file: !12, line: 74, type: !38, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 76, column: 5, scope: !70)
!72 = !DILocation(line: 77, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !74, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!18, !18, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 89, type: !18)
!80 = !DILocation(line: 89, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 89, type: !76)
!82 = !DILocation(line: 89, column: 27, scope: !73)
!83 = !DILocation(line: 92, column: 22, scope: !73)
!84 = !DILocation(line: 92, column: 12, scope: !73)
!85 = !DILocation(line: 92, column: 5, scope: !73)
!86 = !DILocation(line: 94, column: 5, scope: !73)
!87 = !DILocation(line: 95, column: 5, scope: !73)
!88 = !DILocation(line: 96, column: 5, scope: !73)
!89 = !DILocation(line: 99, column: 5, scope: !73)
!90 = !DILocation(line: 100, column: 5, scope: !73)
!91 = !DILocation(line: 101, column: 5, scope: !73)
!92 = !DILocation(line: 103, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !38, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 65, type: !15)
!95 = !DILocation(line: 65, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !12, line: 66, type: !23)
!97 = !DILocation(line: 66, column: 13, scope: !93)
!98 = !DILocation(line: 67, column: 13, scope: !93)
!99 = !DILocation(line: 67, column: 5, scope: !93)
!100 = !DILocation(line: 68, column: 5, scope: !93)
!101 = !DILocation(line: 68, column: 23, scope: !93)
!102 = !DILocation(line: 70, column: 12, scope: !93)
!103 = !DILocation(line: 70, column: 10, scope: !93)
!104 = !DILocation(line: 71, column: 66, scope: !93)
!105 = !DILocation(line: 71, column: 5, scope: !93)
!106 = !DILocation(line: 72, column: 1, scope: !93)
