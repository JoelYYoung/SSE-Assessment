; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %2 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wcscpy(i32* %2, i32* %arraydecay3) #4, !dbg !50
  %3 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %3), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #4, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #4, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !101
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx2, align 4, !dbg !103
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call4 = call i32* @wcscpy(i32* %2, i32* %arraydecay3) #4, !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %3), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay, i32** %data, align 8, !dbg !123
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !131
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx2, align 4, !dbg !133
  %2 = load i32*, i32** %data, align 8, !dbg !134
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call4 = call i32* @wcscpy(i32* %2, i32* %arraydecay3) #4, !dbg !136
  %3 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %3), !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 25, scope: !32)
!34 = !DILocation(line: 28, column: 8, scope: !11)
!35 = !DILocation(line: 32, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 32, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 9, scope: !36)
!39 = !DILocation(line: 33, column: 17, scope: !36)
!40 = !DILocation(line: 34, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 36, type: !27)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!43 = !DILocation(line: 36, column: 17, scope: !42)
!44 = !DILocation(line: 37, column: 17, scope: !42)
!45 = !DILocation(line: 37, column: 9, scope: !42)
!46 = !DILocation(line: 38, column: 9, scope: !42)
!47 = !DILocation(line: 38, column: 23, scope: !42)
!48 = !DILocation(line: 40, column: 16, scope: !42)
!49 = !DILocation(line: 40, column: 22, scope: !42)
!50 = !DILocation(line: 40, column: 9, scope: !42)
!51 = !DILocation(line: 41, column: 20, scope: !42)
!52 = !DILocation(line: 41, column: 9, scope: !42)
!53 = !DILocation(line: 43, column: 1, scope: !11)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_13_good", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 100, column: 5, scope: !54)
!56 = !DILocation(line: 101, column: 5, scope: !54)
!57 = !DILocation(line: 102, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !59, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 114, type: !19)
!65 = !DILocation(line: 114, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 114, type: !61)
!67 = !DILocation(line: 114, column: 27, scope: !58)
!68 = !DILocation(line: 117, column: 22, scope: !58)
!69 = !DILocation(line: 117, column: 12, scope: !58)
!70 = !DILocation(line: 117, column: 5, scope: !58)
!71 = !DILocation(line: 119, column: 5, scope: !58)
!72 = !DILocation(line: 120, column: 5, scope: !58)
!73 = !DILocation(line: 121, column: 5, scope: !58)
!74 = !DILocation(line: 124, column: 5, scope: !58)
!75 = !DILocation(line: 125, column: 5, scope: !58)
!76 = !DILocation(line: 126, column: 5, scope: !58)
!77 = !DILocation(line: 128, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 52, type: !16)
!80 = !DILocation(line: 52, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 53, type: !22)
!82 = !DILocation(line: 53, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 54, type: !27)
!84 = !DILocation(line: 54, column: 13, scope: !78)
!85 = !DILocation(line: 55, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !12, line: 55, column: 8)
!87 = !DILocation(line: 55, column: 25, scope: !86)
!88 = !DILocation(line: 55, column: 8, scope: !78)
!89 = !DILocation(line: 58, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 56, column: 5)
!91 = !DILocation(line: 59, column: 5, scope: !90)
!92 = !DILocation(line: 63, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !12, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 14, scope: !93)
!95 = !DILocation(line: 64, column: 9, scope: !93)
!96 = !DILocation(line: 64, column: 17, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !12, line: 67, type: !27)
!98 = distinct !DILexicalBlock(scope: !78, file: !12, line: 66, column: 5)
!99 = !DILocation(line: 67, column: 17, scope: !98)
!100 = !DILocation(line: 68, column: 17, scope: !98)
!101 = !DILocation(line: 68, column: 9, scope: !98)
!102 = !DILocation(line: 69, column: 9, scope: !98)
!103 = !DILocation(line: 69, column: 23, scope: !98)
!104 = !DILocation(line: 71, column: 16, scope: !98)
!105 = !DILocation(line: 71, column: 22, scope: !98)
!106 = !DILocation(line: 71, column: 9, scope: !98)
!107 = !DILocation(line: 72, column: 20, scope: !98)
!108 = !DILocation(line: 72, column: 9, scope: !98)
!109 = !DILocation(line: 74, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 79, type: !16)
!112 = !DILocation(line: 79, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 80, type: !22)
!114 = !DILocation(line: 80, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 81, type: !27)
!116 = !DILocation(line: 81, column: 13, scope: !110)
!117 = !DILocation(line: 82, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !12, line: 82, column: 8)
!119 = !DILocation(line: 82, column: 25, scope: !118)
!120 = !DILocation(line: 82, column: 8, scope: !110)
!121 = !DILocation(line: 85, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 83, column: 5)
!123 = !DILocation(line: 85, column: 14, scope: !122)
!124 = !DILocation(line: 86, column: 9, scope: !122)
!125 = !DILocation(line: 86, column: 17, scope: !122)
!126 = !DILocation(line: 87, column: 5, scope: !122)
!127 = !DILocalVariable(name: "source", scope: !128, file: !12, line: 89, type: !27)
!128 = distinct !DILexicalBlock(scope: !110, file: !12, line: 88, column: 5)
!129 = !DILocation(line: 89, column: 17, scope: !128)
!130 = !DILocation(line: 90, column: 17, scope: !128)
!131 = !DILocation(line: 90, column: 9, scope: !128)
!132 = !DILocation(line: 91, column: 9, scope: !128)
!133 = !DILocation(line: 91, column: 23, scope: !128)
!134 = !DILocation(line: 93, column: 16, scope: !128)
!135 = !DILocation(line: 93, column: 22, scope: !128)
!136 = !DILocation(line: 93, column: 9, scope: !128)
!137 = !DILocation(line: 94, column: 20, scope: !128)
!138 = !DILocation(line: 94, column: 9, scope: !128)
!139 = !DILocation(line: 96, column: 1, scope: !110)
