; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05_bad() #0 !dbg !21 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !27, metadata !DIExpression()), !dbg !39
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !40
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !41
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !42
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !42
  call void @printLine(i8* %1), !dbg !43
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !44
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !45
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !46
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !49
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay4), !dbg !51
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !52
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !52
  call void @printLine(i8* %2), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05_good() #0 !dbg !56 {
entry:
  call void @good1(), !dbg !57
  call void @good2(), !dbg !58
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !78 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !85, metadata !DIExpression()), !dbg !88
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !89
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !90
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !91
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !91
  call void @printLine(i8* %1), !dbg !92
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !93
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !94
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !94
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !95
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !98
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !99
  call void @printLine(i8* %arraydecay4), !dbg !100
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !101
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !101
  call void @printLine(i8* %2), !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !104 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !105
  %tobool = icmp ne i32 %0, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !108, metadata !DIExpression()), !dbg !111
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !112
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !113
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !114
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !114
  call void @printLine(i8* %1), !dbg !115
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !116
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !117
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !117
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !118
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !121
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay4), !dbg !123
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !124
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !124
  call void @printLine(i8* %2), !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 35, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 36, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05_bad", scope: !13, file: !13, line: 40, type: !22, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocation(line: 42, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !13, line: 42, column: 8)
!26 = !DILocation(line: 42, column: 8, scope: !21)
!27 = !DILocalVariable(name: "structCharVoid", scope: !28, file: !13, line: 45, type: !30)
!28 = distinct !DILexicalBlock(scope: !29, file: !13, line: 44, column: 9)
!29 = distinct !DILexicalBlock(scope: !25, file: !13, line: 43, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !13, line: 30, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !13, line: 25, size: 256, elements: !32)
!32 = !{!33, !37, !38}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !31, file: !13, line: 27, baseType: !34, size: 128)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 16)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !31, file: !13, line: 28, baseType: !6, size: 64, offset: 128)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !31, file: !13, line: 29, baseType: !6, size: 64, offset: 192)
!39 = !DILocation(line: 45, column: 22, scope: !28)
!40 = !DILocation(line: 46, column: 28, scope: !28)
!41 = !DILocation(line: 46, column: 39, scope: !28)
!42 = !DILocation(line: 48, column: 46, scope: !28)
!43 = !DILocation(line: 48, column: 13, scope: !28)
!44 = !DILocation(line: 50, column: 36, scope: !28)
!45 = !DILocation(line: 50, column: 13, scope: !28)
!46 = !DILocation(line: 51, column: 28, scope: !28)
!47 = !DILocation(line: 51, column: 13, scope: !28)
!48 = !DILocation(line: 51, column: 89, scope: !28)
!49 = !DILocation(line: 52, column: 46, scope: !28)
!50 = !DILocation(line: 52, column: 31, scope: !28)
!51 = !DILocation(line: 52, column: 13, scope: !28)
!52 = !DILocation(line: 53, column: 46, scope: !28)
!53 = !DILocation(line: 53, column: 13, scope: !28)
!54 = !DILocation(line: 55, column: 5, scope: !29)
!55 = !DILocation(line: 56, column: 1, scope: !21)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_05_good", scope: !13, file: !13, line: 105, type: !22, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 107, column: 5, scope: !56)
!58 = !DILocation(line: 108, column: 5, scope: !56)
!59 = !DILocation(line: 109, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 120, type: !61, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!14, !14, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !13, line: 120, type: !14)
!65 = !DILocation(line: 120, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !13, line: 120, type: !63)
!67 = !DILocation(line: 120, column: 27, scope: !60)
!68 = !DILocation(line: 123, column: 22, scope: !60)
!69 = !DILocation(line: 123, column: 12, scope: !60)
!70 = !DILocation(line: 123, column: 5, scope: !60)
!71 = !DILocation(line: 125, column: 5, scope: !60)
!72 = !DILocation(line: 126, column: 5, scope: !60)
!73 = !DILocation(line: 127, column: 5, scope: !60)
!74 = !DILocation(line: 130, column: 5, scope: !60)
!75 = !DILocation(line: 131, column: 5, scope: !60)
!76 = !DILocation(line: 132, column: 5, scope: !60)
!77 = !DILocation(line: 134, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "good1", scope: !13, file: !13, line: 63, type: !22, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 65, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !78, file: !13, line: 65, column: 8)
!81 = !DILocation(line: 65, column: 8, scope: !78)
!82 = !DILocation(line: 68, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !13, line: 66, column: 5)
!84 = !DILocation(line: 69, column: 5, scope: !83)
!85 = !DILocalVariable(name: "structCharVoid", scope: !86, file: !13, line: 73, type: !30)
!86 = distinct !DILexicalBlock(scope: !87, file: !13, line: 72, column: 9)
!87 = distinct !DILexicalBlock(scope: !80, file: !13, line: 71, column: 5)
!88 = !DILocation(line: 73, column: 22, scope: !86)
!89 = !DILocation(line: 74, column: 28, scope: !86)
!90 = !DILocation(line: 74, column: 39, scope: !86)
!91 = !DILocation(line: 76, column: 46, scope: !86)
!92 = !DILocation(line: 76, column: 13, scope: !86)
!93 = !DILocation(line: 78, column: 36, scope: !86)
!94 = !DILocation(line: 78, column: 13, scope: !86)
!95 = !DILocation(line: 79, column: 28, scope: !86)
!96 = !DILocation(line: 79, column: 13, scope: !86)
!97 = !DILocation(line: 79, column: 89, scope: !86)
!98 = !DILocation(line: 80, column: 46, scope: !86)
!99 = !DILocation(line: 80, column: 31, scope: !86)
!100 = !DILocation(line: 80, column: 13, scope: !86)
!101 = !DILocation(line: 81, column: 46, scope: !86)
!102 = !DILocation(line: 81, column: 13, scope: !86)
!103 = !DILocation(line: 84, column: 1, scope: !78)
!104 = distinct !DISubprogram(name: "good2", scope: !13, file: !13, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocation(line: 89, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !104, file: !13, line: 89, column: 8)
!107 = !DILocation(line: 89, column: 8, scope: !104)
!108 = !DILocalVariable(name: "structCharVoid", scope: !109, file: !13, line: 92, type: !30)
!109 = distinct !DILexicalBlock(scope: !110, file: !13, line: 91, column: 9)
!110 = distinct !DILexicalBlock(scope: !106, file: !13, line: 90, column: 5)
!111 = !DILocation(line: 92, column: 22, scope: !109)
!112 = !DILocation(line: 93, column: 28, scope: !109)
!113 = !DILocation(line: 93, column: 39, scope: !109)
!114 = !DILocation(line: 95, column: 46, scope: !109)
!115 = !DILocation(line: 95, column: 13, scope: !109)
!116 = !DILocation(line: 97, column: 36, scope: !109)
!117 = !DILocation(line: 97, column: 13, scope: !109)
!118 = !DILocation(line: 98, column: 28, scope: !109)
!119 = !DILocation(line: 98, column: 13, scope: !109)
!120 = !DILocation(line: 98, column: 89, scope: !109)
!121 = !DILocation(line: 99, column: 46, scope: !109)
!122 = !DILocation(line: 99, column: 31, scope: !109)
!123 = !DILocation(line: 99, column: 13, scope: !109)
!124 = !DILocation(line: 100, column: 46, scope: !109)
!125 = !DILocation(line: 100, column: 13, scope: !109)
!126 = !DILocation(line: 102, column: 5, scope: !110)
!127 = !DILocation(line: 103, column: 1, scope: !104)
