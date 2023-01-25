; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %call = call i32 @staticReturnsTrue(), !dbg !26
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
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %5), !dbg !47
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08_good() #0 !dbg !49 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i8* %arraydecay, i8** %data, align 8, !dbg !82
  %call = call i32 @staticReturnsFalse(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %5), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !105 {
entry:
  ret i32 0, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay, i8** %data, align 8, !dbg !113
  %call = call i32 @staticReturnsTrue(), !dbg !114
  %tobool = icmp ne i32 %call, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !119
  %1 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !125
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !127
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !129
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* %5), !dbg !132
  ret void, !dbg !133
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08_bad", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 45, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 45, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 46, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 46, column: 10, scope: !11)
!24 = !DILocation(line: 47, column: 12, scope: !11)
!25 = !DILocation(line: 47, column: 10, scope: !11)
!26 = !DILocation(line: 48, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 8)
!28 = !DILocation(line: 48, column: 8, scope: !11)
!29 = !DILocation(line: 51, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 49, column: 5)
!31 = !DILocation(line: 51, column: 9, scope: !30)
!32 = !DILocation(line: 52, column: 9, scope: !30)
!33 = !DILocation(line: 52, column: 21, scope: !30)
!34 = !DILocation(line: 53, column: 5, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 55, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 55, column: 14, scope: !36)
!41 = !DILocation(line: 57, column: 18, scope: !36)
!42 = !DILocation(line: 57, column: 31, scope: !36)
!43 = !DILocation(line: 57, column: 24, scope: !36)
!44 = !DILocation(line: 57, column: 44, scope: !36)
!45 = !DILocation(line: 57, column: 9, scope: !36)
!46 = !DILocation(line: 58, column: 19, scope: !36)
!47 = !DILocation(line: 58, column: 9, scope: !36)
!48 = !DILocation(line: 60, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_08_good", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 113, column: 5, scope: !49)
!51 = !DILocation(line: 114, column: 5, scope: !49)
!52 = !DILocation(line: 115, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !54, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 127, type: !56)
!59 = !DILocation(line: 127, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 127, type: !57)
!61 = !DILocation(line: 127, column: 27, scope: !53)
!62 = !DILocation(line: 130, column: 22, scope: !53)
!63 = !DILocation(line: 130, column: 12, scope: !53)
!64 = !DILocation(line: 130, column: 5, scope: !53)
!65 = !DILocation(line: 132, column: 5, scope: !53)
!66 = !DILocation(line: 133, column: 5, scope: !53)
!67 = !DILocation(line: 134, column: 5, scope: !53)
!68 = !DILocation(line: 137, column: 5, scope: !53)
!69 = !DILocation(line: 138, column: 5, scope: !53)
!70 = !DILocation(line: 139, column: 5, scope: !53)
!71 = !DILocation(line: 141, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 31, type: !73, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!56}
!75 = !DILocation(line: 33, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 69, type: !16)
!78 = !DILocation(line: 69, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 70, type: !20)
!80 = !DILocation(line: 70, column: 10, scope: !76)
!81 = !DILocation(line: 71, column: 12, scope: !76)
!82 = !DILocation(line: 71, column: 10, scope: !76)
!83 = !DILocation(line: 72, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !12, line: 72, column: 8)
!85 = !DILocation(line: 72, column: 8, scope: !76)
!86 = !DILocation(line: 75, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 73, column: 5)
!88 = !DILocation(line: 76, column: 5, scope: !87)
!89 = !DILocation(line: 80, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !12, line: 78, column: 5)
!91 = !DILocation(line: 80, column: 9, scope: !90)
!92 = !DILocation(line: 81, column: 9, scope: !90)
!93 = !DILocation(line: 81, column: 20, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 84, type: !37)
!95 = distinct !DILexicalBlock(scope: !76, file: !12, line: 83, column: 5)
!96 = !DILocation(line: 84, column: 14, scope: !95)
!97 = !DILocation(line: 86, column: 18, scope: !95)
!98 = !DILocation(line: 86, column: 31, scope: !95)
!99 = !DILocation(line: 86, column: 24, scope: !95)
!100 = !DILocation(line: 86, column: 44, scope: !95)
!101 = !DILocation(line: 86, column: 9, scope: !95)
!102 = !DILocation(line: 87, column: 19, scope: !95)
!103 = !DILocation(line: 87, column: 9, scope: !95)
!104 = !DILocation(line: 89, column: 1, scope: !76)
!105 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 36, type: !73, scopeLine: 37, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 38, column: 5, scope: !105)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 94, type: !16)
!109 = !DILocation(line: 94, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !12, line: 95, type: !20)
!111 = !DILocation(line: 95, column: 10, scope: !107)
!112 = !DILocation(line: 96, column: 12, scope: !107)
!113 = !DILocation(line: 96, column: 10, scope: !107)
!114 = !DILocation(line: 97, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !12, line: 97, column: 8)
!116 = !DILocation(line: 97, column: 8, scope: !107)
!117 = !DILocation(line: 100, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 98, column: 5)
!119 = !DILocation(line: 100, column: 9, scope: !118)
!120 = !DILocation(line: 101, column: 9, scope: !118)
!121 = !DILocation(line: 101, column: 20, scope: !118)
!122 = !DILocation(line: 102, column: 5, scope: !118)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 104, type: !37)
!124 = distinct !DILexicalBlock(scope: !107, file: !12, line: 103, column: 5)
!125 = !DILocation(line: 104, column: 14, scope: !124)
!126 = !DILocation(line: 106, column: 18, scope: !124)
!127 = !DILocation(line: 106, column: 31, scope: !124)
!128 = !DILocation(line: 106, column: 24, scope: !124)
!129 = !DILocation(line: 106, column: 44, scope: !124)
!130 = !DILocation(line: 106, column: 9, scope: !124)
!131 = !DILocation(line: 107, column: 19, scope: !124)
!132 = !DILocation(line: 107, column: 9, scope: !124)
!133 = !DILocation(line: 109, column: 1, scope: !107)
