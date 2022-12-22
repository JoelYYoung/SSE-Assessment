; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  %call = call i64 @strlen(i8* %4) #6, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09_good() #0 !dbg !49 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !77
  store i8* %arraydecay, i8** %data, align 8, !dbg !78
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %call = call i64 @strlen(i8* %4) #6, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %6), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !107
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !108
  %tobool = icmp ne i32 %0, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !119
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %call = call i64 @strlen(i8* %4) #6, !dbg !122
  %5 = load i8*, i8** %data, align 8, !dbg !123
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %6), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 32, column: 10, scope: !11)
!24 = !DILocation(line: 33, column: 12, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 34, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 8)
!28 = !DILocation(line: 34, column: 8, scope: !11)
!29 = !DILocation(line: 37, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 35, column: 5)
!31 = !DILocation(line: 37, column: 9, scope: !30)
!32 = !DILocation(line: 38, column: 9, scope: !30)
!33 = !DILocation(line: 38, column: 21, scope: !30)
!34 = !DILocation(line: 39, column: 5, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 41, column: 14, scope: !36)
!41 = !DILocation(line: 43, column: 18, scope: !36)
!42 = !DILocation(line: 43, column: 31, scope: !36)
!43 = !DILocation(line: 43, column: 24, scope: !36)
!44 = !DILocation(line: 43, column: 44, scope: !36)
!45 = !DILocation(line: 43, column: 9, scope: !36)
!46 = !DILocation(line: 44, column: 19, scope: !36)
!47 = !DILocation(line: 44, column: 9, scope: !36)
!48 = !DILocation(line: 46, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_09_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 99, column: 5, scope: !49)
!51 = !DILocation(line: 100, column: 5, scope: !49)
!52 = !DILocation(line: 101, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !54, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 113, type: !56)
!59 = !DILocation(line: 113, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 113, type: !57)
!61 = !DILocation(line: 113, column: 27, scope: !53)
!62 = !DILocation(line: 116, column: 22, scope: !53)
!63 = !DILocation(line: 116, column: 12, scope: !53)
!64 = !DILocation(line: 116, column: 5, scope: !53)
!65 = !DILocation(line: 118, column: 5, scope: !53)
!66 = !DILocation(line: 119, column: 5, scope: !53)
!67 = !DILocation(line: 120, column: 5, scope: !53)
!68 = !DILocation(line: 123, column: 5, scope: !53)
!69 = !DILocation(line: 124, column: 5, scope: !53)
!70 = !DILocation(line: 125, column: 5, scope: !53)
!71 = !DILocation(line: 127, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 55, type: !16)
!74 = !DILocation(line: 55, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 56, type: !20)
!76 = !DILocation(line: 56, column: 10, scope: !72)
!77 = !DILocation(line: 57, column: 12, scope: !72)
!78 = !DILocation(line: 57, column: 10, scope: !72)
!79 = !DILocation(line: 58, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !12, line: 58, column: 8)
!81 = !DILocation(line: 58, column: 8, scope: !72)
!82 = !DILocation(line: 61, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 59, column: 5)
!84 = !DILocation(line: 62, column: 5, scope: !83)
!85 = !DILocation(line: 66, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !12, line: 64, column: 5)
!87 = !DILocation(line: 66, column: 9, scope: !86)
!88 = !DILocation(line: 67, column: 9, scope: !86)
!89 = !DILocation(line: 67, column: 20, scope: !86)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 70, type: !37)
!91 = distinct !DILexicalBlock(scope: !72, file: !12, line: 69, column: 5)
!92 = !DILocation(line: 70, column: 14, scope: !91)
!93 = !DILocation(line: 72, column: 18, scope: !91)
!94 = !DILocation(line: 72, column: 31, scope: !91)
!95 = !DILocation(line: 72, column: 24, scope: !91)
!96 = !DILocation(line: 72, column: 44, scope: !91)
!97 = !DILocation(line: 72, column: 9, scope: !91)
!98 = !DILocation(line: 73, column: 19, scope: !91)
!99 = !DILocation(line: 73, column: 9, scope: !91)
!100 = !DILocation(line: 75, column: 1, scope: !72)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 80, type: !16)
!103 = !DILocation(line: 80, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 81, type: !20)
!105 = !DILocation(line: 81, column: 10, scope: !101)
!106 = !DILocation(line: 82, column: 12, scope: !101)
!107 = !DILocation(line: 82, column: 10, scope: !101)
!108 = !DILocation(line: 83, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !12, line: 83, column: 8)
!110 = !DILocation(line: 83, column: 8, scope: !101)
!111 = !DILocation(line: 86, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 84, column: 5)
!113 = !DILocation(line: 86, column: 9, scope: !112)
!114 = !DILocation(line: 87, column: 9, scope: !112)
!115 = !DILocation(line: 87, column: 20, scope: !112)
!116 = !DILocation(line: 88, column: 5, scope: !112)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !12, line: 90, type: !37)
!118 = distinct !DILexicalBlock(scope: !101, file: !12, line: 89, column: 5)
!119 = !DILocation(line: 90, column: 14, scope: !118)
!120 = !DILocation(line: 92, column: 18, scope: !118)
!121 = !DILocation(line: 92, column: 31, scope: !118)
!122 = !DILocation(line: 92, column: 24, scope: !118)
!123 = !DILocation(line: 92, column: 44, scope: !118)
!124 = !DILocation(line: 92, column: 9, scope: !118)
!125 = !DILocation(line: 93, column: 19, scope: !118)
!126 = !DILocation(line: 93, column: 9, scope: !118)
!127 = !DILocation(line: 95, column: 1, scope: !101)
