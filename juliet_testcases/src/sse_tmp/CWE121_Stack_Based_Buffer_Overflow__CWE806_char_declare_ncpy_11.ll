; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %call2 = call i64 @strlen(i8* %4) #6, !dbg !44
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %3, i64 %call2) #7, !dbg !45
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11_good() #0 !dbg !51 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %call = call i32 (...) @globalReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %call2 = call i64 @strlen(i8* %4) #6, !dbg !98
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %3, i64 %call2) #7, !dbg !99
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !100
  store i8 0, i8* %arrayidx4, align 1, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %5), !dbg !103
  ret void, !dbg !104
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !111
  %call = call i32 (...) @globalReturnsTrue(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !117
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !123
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !124
  %3 = load i8*, i8** %data, align 8, !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  %call2 = call i64 @strlen(i8* %4) #6, !dbg !127
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %3, i64 %call2) #7, !dbg !128
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !129
  store i8 0, i8* %arrayidx4, align 1, !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* %5), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 5, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 37, column: 17, scope: !36)
!42 = !DILocation(line: 37, column: 23, scope: !36)
!43 = !DILocation(line: 37, column: 36, scope: !36)
!44 = !DILocation(line: 37, column: 29, scope: !36)
!45 = !DILocation(line: 37, column: 9, scope: !36)
!46 = !DILocation(line: 38, column: 9, scope: !36)
!47 = !DILocation(line: 38, column: 20, scope: !36)
!48 = !DILocation(line: 39, column: 19, scope: !36)
!49 = !DILocation(line: 39, column: 9, scope: !36)
!50 = !DILocation(line: 41, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_11_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 96, column: 5, scope: !51)
!53 = !DILocation(line: 97, column: 5, scope: !51)
!54 = !DILocation(line: 98, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !56, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 110, type: !58)
!61 = !DILocation(line: 110, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 110, type: !59)
!63 = !DILocation(line: 110, column: 27, scope: !55)
!64 = !DILocation(line: 113, column: 22, scope: !55)
!65 = !DILocation(line: 113, column: 12, scope: !55)
!66 = !DILocation(line: 113, column: 5, scope: !55)
!67 = !DILocation(line: 115, column: 5, scope: !55)
!68 = !DILocation(line: 116, column: 5, scope: !55)
!69 = !DILocation(line: 117, column: 5, scope: !55)
!70 = !DILocation(line: 120, column: 5, scope: !55)
!71 = !DILocation(line: 121, column: 5, scope: !55)
!72 = !DILocation(line: 122, column: 5, scope: !55)
!73 = !DILocation(line: 124, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 50, type: !16)
!76 = !DILocation(line: 50, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 51, type: !20)
!78 = !DILocation(line: 51, column: 10, scope: !74)
!79 = !DILocation(line: 52, column: 12, scope: !74)
!80 = !DILocation(line: 52, column: 10, scope: !74)
!81 = !DILocation(line: 53, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 53, column: 8)
!83 = !DILocation(line: 53, column: 8, scope: !74)
!84 = !DILocation(line: 56, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 54, column: 5)
!86 = !DILocation(line: 57, column: 5, scope: !85)
!87 = !DILocation(line: 61, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 59, column: 5)
!89 = !DILocation(line: 61, column: 9, scope: !88)
!90 = !DILocation(line: 62, column: 9, scope: !88)
!91 = !DILocation(line: 62, column: 20, scope: !88)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 65, type: !37)
!93 = distinct !DILexicalBlock(scope: !74, file: !12, line: 64, column: 5)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocation(line: 67, column: 17, scope: !93)
!96 = !DILocation(line: 67, column: 23, scope: !93)
!97 = !DILocation(line: 67, column: 36, scope: !93)
!98 = !DILocation(line: 67, column: 29, scope: !93)
!99 = !DILocation(line: 67, column: 9, scope: !93)
!100 = !DILocation(line: 68, column: 9, scope: !93)
!101 = !DILocation(line: 68, column: 20, scope: !93)
!102 = !DILocation(line: 69, column: 19, scope: !93)
!103 = !DILocation(line: 69, column: 9, scope: !93)
!104 = !DILocation(line: 71, column: 1, scope: !74)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 76, type: !16)
!107 = !DILocation(line: 76, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 77, type: !20)
!109 = !DILocation(line: 77, column: 10, scope: !105)
!110 = !DILocation(line: 78, column: 12, scope: !105)
!111 = !DILocation(line: 78, column: 10, scope: !105)
!112 = !DILocation(line: 79, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 79, column: 8)
!114 = !DILocation(line: 79, column: 8, scope: !105)
!115 = !DILocation(line: 82, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 80, column: 5)
!117 = !DILocation(line: 82, column: 9, scope: !116)
!118 = !DILocation(line: 83, column: 9, scope: !116)
!119 = !DILocation(line: 83, column: 20, scope: !116)
!120 = !DILocation(line: 84, column: 5, scope: !116)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 86, type: !37)
!122 = distinct !DILexicalBlock(scope: !105, file: !12, line: 85, column: 5)
!123 = !DILocation(line: 86, column: 14, scope: !122)
!124 = !DILocation(line: 88, column: 17, scope: !122)
!125 = !DILocation(line: 88, column: 23, scope: !122)
!126 = !DILocation(line: 88, column: 36, scope: !122)
!127 = !DILocation(line: 88, column: 29, scope: !122)
!128 = !DILocation(line: 88, column: 9, scope: !122)
!129 = !DILocation(line: 89, column: 9, scope: !122)
!130 = !DILocation(line: 89, column: 20, scope: !122)
!131 = !DILocation(line: 90, column: 19, scope: !122)
!132 = !DILocation(line: 90, column: 9, scope: !122)
!133 = !DILocation(line: 92, column: 1, scope: !105)
