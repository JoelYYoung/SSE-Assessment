; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %call1 = call i32 @staticReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call1, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx5, align 4, !dbg !44
  %0 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call7 = call i32* @wcscpy(i32* %0, i32* %arraydecay6) #4, !dbg !47
  %1 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %1), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #4, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #4, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !75 {
entry:
  ret i32 1, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %call1 = call i32 @staticReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call1, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay2, i32** %data, align 8, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !101
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx5, align 4, !dbg !103
  %0 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call7 = call i32* @wcscpy(i32* %0, i32* %arraydecay6) #4, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %1), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !110 {
entry:
  ret i32 0, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !117
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !118
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %call1 = call i32 @staticReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call1, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !124
  store i32* %arraydecay2, i32** %data, align 8, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !132
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx5, align 4, !dbg !134
  %0 = load i32*, i32** %data, align 8, !dbg !135
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call7 = call i32* @wcscpy(i32* %0, i32* %arraydecay6) #4, !dbg !137
  %1 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %1), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 13, scope: !11)
!27 = !DILocation(line: 41, column: 5, scope: !11)
!28 = !DILocation(line: 42, column: 5, scope: !11)
!29 = !DILocation(line: 42, column: 23, scope: !11)
!30 = !DILocation(line: 43, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 8)
!32 = !DILocation(line: 43, column: 8, scope: !11)
!33 = !DILocation(line: 46, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 44, column: 5)
!35 = !DILocation(line: 46, column: 27, scope: !34)
!36 = !DILocation(line: 46, column: 14, scope: !34)
!37 = !DILocation(line: 47, column: 5, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 49, type: !22)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!40 = !DILocation(line: 49, column: 17, scope: !39)
!41 = !DILocation(line: 50, column: 17, scope: !39)
!42 = !DILocation(line: 50, column: 9, scope: !39)
!43 = !DILocation(line: 51, column: 9, scope: !39)
!44 = !DILocation(line: 51, column: 23, scope: !39)
!45 = !DILocation(line: 53, column: 16, scope: !39)
!46 = !DILocation(line: 53, column: 22, scope: !39)
!47 = !DILocation(line: 53, column: 9, scope: !39)
!48 = !DILocation(line: 54, column: 20, scope: !39)
!49 = !DILocation(line: 54, column: 9, scope: !39)
!50 = !DILocation(line: 56, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_08_good", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 113, column: 5, scope: !51)
!53 = !DILocation(line: 114, column: 5, scope: !51)
!54 = !DILocation(line: 115, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !56, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!19, !19, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 127, type: !19)
!62 = !DILocation(line: 127, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 127, type: !58)
!64 = !DILocation(line: 127, column: 27, scope: !55)
!65 = !DILocation(line: 130, column: 22, scope: !55)
!66 = !DILocation(line: 130, column: 12, scope: !55)
!67 = !DILocation(line: 130, column: 5, scope: !55)
!68 = !DILocation(line: 132, column: 5, scope: !55)
!69 = !DILocation(line: 133, column: 5, scope: !55)
!70 = !DILocation(line: 134, column: 5, scope: !55)
!71 = !DILocation(line: 137, column: 5, scope: !55)
!72 = !DILocation(line: 138, column: 5, scope: !55)
!73 = !DILocation(line: 139, column: 5, scope: !55)
!74 = !DILocation(line: 141, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !76, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!19}
!78 = !DILocation(line: 27, column: 5, scope: !75)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 65, type: !16)
!81 = !DILocation(line: 65, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 66, type: !22)
!83 = !DILocation(line: 66, column: 13, scope: !79)
!84 = !DILocation(line: 67, column: 13, scope: !79)
!85 = !DILocation(line: 67, column: 5, scope: !79)
!86 = !DILocation(line: 68, column: 5, scope: !79)
!87 = !DILocation(line: 68, column: 23, scope: !79)
!88 = !DILocation(line: 69, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !12, line: 69, column: 8)
!90 = !DILocation(line: 69, column: 8, scope: !79)
!91 = !DILocation(line: 72, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 70, column: 5)
!93 = !DILocation(line: 73, column: 5, scope: !92)
!94 = !DILocation(line: 77, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !12, line: 75, column: 5)
!96 = !DILocation(line: 77, column: 14, scope: !95)
!97 = !DILocalVariable(name: "source", scope: !98, file: !12, line: 80, type: !22)
!98 = distinct !DILexicalBlock(scope: !79, file: !12, line: 79, column: 5)
!99 = !DILocation(line: 80, column: 17, scope: !98)
!100 = !DILocation(line: 81, column: 17, scope: !98)
!101 = !DILocation(line: 81, column: 9, scope: !98)
!102 = !DILocation(line: 82, column: 9, scope: !98)
!103 = !DILocation(line: 82, column: 23, scope: !98)
!104 = !DILocation(line: 84, column: 16, scope: !98)
!105 = !DILocation(line: 84, column: 22, scope: !98)
!106 = !DILocation(line: 84, column: 9, scope: !98)
!107 = !DILocation(line: 85, column: 20, scope: !98)
!108 = !DILocation(line: 85, column: 9, scope: !98)
!109 = !DILocation(line: 87, column: 1, scope: !79)
!110 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !76, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 32, column: 5, scope: !110)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 92, type: !16)
!114 = !DILocation(line: 92, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !12, line: 93, type: !22)
!116 = !DILocation(line: 93, column: 13, scope: !112)
!117 = !DILocation(line: 94, column: 13, scope: !112)
!118 = !DILocation(line: 94, column: 5, scope: !112)
!119 = !DILocation(line: 95, column: 5, scope: !112)
!120 = !DILocation(line: 95, column: 23, scope: !112)
!121 = !DILocation(line: 96, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !12, line: 96, column: 8)
!123 = !DILocation(line: 96, column: 8, scope: !112)
!124 = !DILocation(line: 99, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 97, column: 5)
!126 = !DILocation(line: 99, column: 14, scope: !125)
!127 = !DILocation(line: 100, column: 5, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !12, line: 102, type: !22)
!129 = distinct !DILexicalBlock(scope: !112, file: !12, line: 101, column: 5)
!130 = !DILocation(line: 102, column: 17, scope: !129)
!131 = !DILocation(line: 103, column: 17, scope: !129)
!132 = !DILocation(line: 103, column: 9, scope: !129)
!133 = !DILocation(line: 104, column: 9, scope: !129)
!134 = !DILocation(line: 104, column: 23, scope: !129)
!135 = !DILocation(line: 106, column: 16, scope: !129)
!136 = !DILocation(line: 106, column: 22, scope: !129)
!137 = !DILocation(line: 106, column: 9, scope: !129)
!138 = !DILocation(line: 107, column: 20, scope: !129)
!139 = !DILocation(line: 107, column: 9, scope: !129)
!140 = !DILocation(line: 109, column: 1, scope: !112)
