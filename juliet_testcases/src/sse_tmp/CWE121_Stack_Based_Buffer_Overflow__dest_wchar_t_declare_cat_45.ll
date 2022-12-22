; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
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
  %call = call i64 @time(i64* null) #4, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #4, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !71, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !74
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !75
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !79
  %call2 = call i32* @wcscat(i32* %1, i32* %arraydecay1) #4, !dbg !80
  %2 = load i32*, i32** %data, align 8, !dbg !81
  call void @printWLine(i32* %2), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i32* %arraydecay, i32** %data, align 8, !dbg !92
  %0 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_goodG2BData, align 8, !dbg !96
  call void @goodG2BSink(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_goodG2BData, align 8, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call2 = call i32* @wcscat(i32* %1, i32* %arraydecay1) #4, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %2), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_bad", scope: !10, file: !10, line: 39, type: !22, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 41, type: !11)
!25 = !DILocation(line: 41, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !10, line: 42, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 42, column: 13, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !10, line: 43, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 43, column: 13, scope: !21)
!36 = !DILocation(line: 46, column: 12, scope: !21)
!37 = !DILocation(line: 46, column: 10, scope: !21)
!38 = !DILocation(line: 47, column: 5, scope: !21)
!39 = !DILocation(line: 47, column: 13, scope: !21)
!40 = !DILocation(line: 48, column: 79, scope: !21)
!41 = !DILocation(line: 48, column: 77, scope: !21)
!42 = !DILocation(line: 49, column: 5, scope: !21)
!43 = !DILocation(line: 50, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cat_45_good", scope: !10, file: !10, line: 82, type: !22, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 84, column: 5, scope: !44)
!46 = !DILocation(line: 85, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 96, type: !48, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 96, type: !14)
!54 = !DILocation(line: 96, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 96, type: !50)
!56 = !DILocation(line: 96, column: 27, scope: !47)
!57 = !DILocation(line: 99, column: 22, scope: !47)
!58 = !DILocation(line: 99, column: 12, scope: !47)
!59 = !DILocation(line: 99, column: 5, scope: !47)
!60 = !DILocation(line: 101, column: 5, scope: !47)
!61 = !DILocation(line: 102, column: 5, scope: !47)
!62 = !DILocation(line: 103, column: 5, scope: !47)
!63 = !DILocation(line: 106, column: 5, scope: !47)
!64 = !DILocation(line: 107, column: 5, scope: !47)
!65 = !DILocation(line: 108, column: 5, scope: !47)
!66 = !DILocation(line: 110, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 28, type: !11)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !10, line: 30, type: !32)
!72 = distinct !DILexicalBlock(scope: !67, file: !10, line: 29, column: 5)
!73 = !DILocation(line: 30, column: 17, scope: !72)
!74 = !DILocation(line: 31, column: 17, scope: !72)
!75 = !DILocation(line: 31, column: 9, scope: !72)
!76 = !DILocation(line: 32, column: 9, scope: !72)
!77 = !DILocation(line: 32, column: 23, scope: !72)
!78 = !DILocation(line: 34, column: 16, scope: !72)
!79 = !DILocation(line: 34, column: 22, scope: !72)
!80 = !DILocation(line: 34, column: 9, scope: !72)
!81 = !DILocation(line: 35, column: 20, scope: !72)
!82 = !DILocation(line: 35, column: 9, scope: !72)
!83 = !DILocation(line: 37, column: 1, scope: !67)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 70, type: !22, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !10, line: 72, type: !11)
!86 = !DILocation(line: 72, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !10, line: 73, type: !27)
!88 = !DILocation(line: 73, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !10, line: 74, type: !32)
!90 = !DILocation(line: 74, column: 13, scope: !84)
!91 = !DILocation(line: 76, column: 12, scope: !84)
!92 = !DILocation(line: 76, column: 10, scope: !84)
!93 = !DILocation(line: 77, column: 5, scope: !84)
!94 = !DILocation(line: 77, column: 13, scope: !84)
!95 = !DILocation(line: 78, column: 83, scope: !84)
!96 = !DILocation(line: 78, column: 81, scope: !84)
!97 = !DILocation(line: 79, column: 5, scope: !84)
!98 = !DILocation(line: 80, column: 1, scope: !84)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 59, type: !11)
!101 = !DILocation(line: 59, column: 15, scope: !99)
!102 = !DILocation(line: 59, column: 22, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !10, line: 61, type: !32)
!104 = distinct !DILexicalBlock(scope: !99, file: !10, line: 60, column: 5)
!105 = !DILocation(line: 61, column: 17, scope: !104)
!106 = !DILocation(line: 62, column: 17, scope: !104)
!107 = !DILocation(line: 62, column: 9, scope: !104)
!108 = !DILocation(line: 63, column: 9, scope: !104)
!109 = !DILocation(line: 63, column: 23, scope: !104)
!110 = !DILocation(line: 65, column: 16, scope: !104)
!111 = !DILocation(line: 65, column: 22, scope: !104)
!112 = !DILocation(line: 65, column: 9, scope: !104)
!113 = !DILocation(line: 66, column: 20, scope: !104)
!114 = !DILocation(line: 66, column: 9, scope: !104)
!115 = !DILocation(line: 68, column: 1, scope: !99)
