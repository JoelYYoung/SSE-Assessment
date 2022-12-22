; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call5 = call i32* @wcsncpy(i32* %1, i32* %arraydecay4, i64 99) #4, !dbg !49
  %2 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !50
  store i32 0, i32* %arrayidx6, align 4, !dbg !51
  %3 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %3), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
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
  %call = call i64 @time(i64* null) #4, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #4, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !79 {
entry:
  ret i32 1, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i32 @staticReturnsFalse(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data, align 8, !dbg !98
  %0 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call5 = call i32* @wcsncpy(i32* %1, i32* %arraydecay4, i64 99) #4, !dbg !110
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !111
  store i32 0, i32* %arrayidx6, align 4, !dbg !112
  %3 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %3), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !116 {
entry:
  ret i32 0, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i32 @staticReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  store i32* %arraydecay, i32** %data, align 8, !dbg !130
  %0 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx3, align 4, !dbg !140
  %1 = load i32*, i32** %data, align 8, !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !142
  %call5 = call i32* @wcsncpy(i32* %1, i32* %arraydecay4, i64 99) #4, !dbg !143
  %2 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !144
  store i32 0, i32* %arrayidx6, align 4, !dbg !145
  %3 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %3), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 41, column: 13, scope: !11)
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !11)
!34 = !DILocation(line: 46, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 43, column: 5)
!36 = !DILocation(line: 46, column: 14, scope: !35)
!37 = !DILocation(line: 47, column: 9, scope: !35)
!38 = !DILocation(line: 47, column: 17, scope: !35)
!39 = !DILocation(line: 48, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 50, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 49, column: 5)
!42 = !DILocation(line: 50, column: 17, scope: !41)
!43 = !DILocation(line: 51, column: 17, scope: !41)
!44 = !DILocation(line: 51, column: 9, scope: !41)
!45 = !DILocation(line: 52, column: 9, scope: !41)
!46 = !DILocation(line: 52, column: 23, scope: !41)
!47 = !DILocation(line: 54, column: 17, scope: !41)
!48 = !DILocation(line: 54, column: 23, scope: !41)
!49 = !DILocation(line: 54, column: 9, scope: !41)
!50 = !DILocation(line: 55, column: 9, scope: !41)
!51 = !DILocation(line: 55, column: 21, scope: !41)
!52 = !DILocation(line: 56, column: 20, scope: !41)
!53 = !DILocation(line: 56, column: 9, scope: !41)
!54 = !DILocation(line: 58, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 117, column: 5, scope: !55)
!57 = !DILocation(line: 118, column: 5, scope: !55)
!58 = !DILocation(line: 119, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !60, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 131, type: !19)
!66 = !DILocation(line: 131, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 131, type: !62)
!68 = !DILocation(line: 131, column: 27, scope: !59)
!69 = !DILocation(line: 134, column: 22, scope: !59)
!70 = !DILocation(line: 134, column: 12, scope: !59)
!71 = !DILocation(line: 134, column: 5, scope: !59)
!72 = !DILocation(line: 136, column: 5, scope: !59)
!73 = !DILocation(line: 137, column: 5, scope: !59)
!74 = !DILocation(line: 138, column: 5, scope: !59)
!75 = !DILocation(line: 141, column: 5, scope: !59)
!76 = !DILocation(line: 142, column: 5, scope: !59)
!77 = !DILocation(line: 143, column: 5, scope: !59)
!78 = !DILocation(line: 145, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !80, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!19}
!82 = !DILocation(line: 27, column: 5, scope: !79)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 67, type: !16)
!85 = !DILocation(line: 67, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 68, type: !22)
!87 = !DILocation(line: 68, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 69, type: !27)
!89 = !DILocation(line: 69, column: 13, scope: !83)
!90 = !DILocation(line: 70, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !12, line: 70, column: 8)
!92 = !DILocation(line: 70, column: 8, scope: !83)
!93 = !DILocation(line: 73, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !12, line: 71, column: 5)
!95 = !DILocation(line: 74, column: 5, scope: !94)
!96 = !DILocation(line: 78, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !12, line: 76, column: 5)
!98 = !DILocation(line: 78, column: 14, scope: !97)
!99 = !DILocation(line: 79, column: 9, scope: !97)
!100 = !DILocation(line: 79, column: 17, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !12, line: 82, type: !27)
!102 = distinct !DILexicalBlock(scope: !83, file: !12, line: 81, column: 5)
!103 = !DILocation(line: 82, column: 17, scope: !102)
!104 = !DILocation(line: 83, column: 17, scope: !102)
!105 = !DILocation(line: 83, column: 9, scope: !102)
!106 = !DILocation(line: 84, column: 9, scope: !102)
!107 = !DILocation(line: 84, column: 23, scope: !102)
!108 = !DILocation(line: 86, column: 17, scope: !102)
!109 = !DILocation(line: 86, column: 23, scope: !102)
!110 = !DILocation(line: 86, column: 9, scope: !102)
!111 = !DILocation(line: 87, column: 9, scope: !102)
!112 = !DILocation(line: 87, column: 21, scope: !102)
!113 = !DILocation(line: 88, column: 20, scope: !102)
!114 = !DILocation(line: 88, column: 9, scope: !102)
!115 = !DILocation(line: 90, column: 1, scope: !83)
!116 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !80, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocation(line: 32, column: 5, scope: !116)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !12, line: 95, type: !16)
!120 = !DILocation(line: 95, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !12, line: 96, type: !22)
!122 = !DILocation(line: 96, column: 13, scope: !118)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !12, line: 97, type: !27)
!124 = !DILocation(line: 97, column: 13, scope: !118)
!125 = !DILocation(line: 98, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !118, file: !12, line: 98, column: 8)
!127 = !DILocation(line: 98, column: 8, scope: !118)
!128 = !DILocation(line: 101, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 99, column: 5)
!130 = !DILocation(line: 101, column: 14, scope: !129)
!131 = !DILocation(line: 102, column: 9, scope: !129)
!132 = !DILocation(line: 102, column: 17, scope: !129)
!133 = !DILocation(line: 103, column: 5, scope: !129)
!134 = !DILocalVariable(name: "source", scope: !135, file: !12, line: 105, type: !27)
!135 = distinct !DILexicalBlock(scope: !118, file: !12, line: 104, column: 5)
!136 = !DILocation(line: 105, column: 17, scope: !135)
!137 = !DILocation(line: 106, column: 17, scope: !135)
!138 = !DILocation(line: 106, column: 9, scope: !135)
!139 = !DILocation(line: 107, column: 9, scope: !135)
!140 = !DILocation(line: 107, column: 23, scope: !135)
!141 = !DILocation(line: 109, column: 17, scope: !135)
!142 = !DILocation(line: 109, column: 23, scope: !135)
!143 = !DILocation(line: 109, column: 9, scope: !135)
!144 = !DILocation(line: 110, column: 9, scope: !135)
!145 = !DILocation(line: 110, column: 21, scope: !135)
!146 = !DILocation(line: 111, column: 20, scope: !135)
!147 = !DILocation(line: 111, column: 9, scope: !135)
!148 = !DILocation(line: 113, column: 1, scope: !118)
