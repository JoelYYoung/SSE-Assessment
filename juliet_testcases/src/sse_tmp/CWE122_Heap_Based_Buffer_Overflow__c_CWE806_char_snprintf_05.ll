; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %1, 0, !dbg !34
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !36

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end2, !dbg !42

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !53
  %7 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %7), !dbg !55
  %8 = load i8*, i8** %data, align 8, !dbg !56
  call void @free(i8* %8) #7, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %1, 0, !dbg !92
  br i1 %tobool, label %if.then1, label %if.else, !dbg !94

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end2, !dbg !97

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !110
  %7 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %7), !dbg !112
  %8 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %8) #7, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !119
  store i8* %call, i8** %data, align 8, !dbg !120
  %0 = load i8*, i8** %data, align 8, !dbg !121
  %cmp = icmp eq i8* %0, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !127
  %tobool = icmp ne i32 %1, 0, !dbg !127
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !129

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !132
  %3 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  br label %if.end2, !dbg !135

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !138
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !139
  %5 = load i8*, i8** %data, align 8, !dbg !140
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !141
  %6 = load i8*, i8** %data, align 8, !dbg !142
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !143
  %7 = load i8*, i8** %data, align 8, !dbg !144
  call void @printLine(i8* %7), !dbg !145
  %8 = load i8*, i8** %data, align 8, !dbg !146
  call void @free(i8* %8) #7, !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 31, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 32, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05_bad", scope: !13, file: !13, line: 36, type: !22, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 38, type: !6)
!25 = !DILocation(line: 38, column: 12, scope: !21)
!26 = !DILocation(line: 39, column: 20, scope: !21)
!27 = !DILocation(line: 39, column: 10, scope: !21)
!28 = !DILocation(line: 40, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !13, line: 40, column: 9)
!30 = !DILocation(line: 40, column: 14, scope: !29)
!31 = !DILocation(line: 40, column: 9, scope: !21)
!32 = !DILocation(line: 40, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 40, column: 23)
!34 = !DILocation(line: 41, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 8)
!36 = !DILocation(line: 41, column: 8, scope: !21)
!37 = !DILocation(line: 44, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !13, line: 42, column: 5)
!39 = !DILocation(line: 44, column: 9, scope: !38)
!40 = !DILocation(line: 45, column: 9, scope: !38)
!41 = !DILocation(line: 45, column: 21, scope: !38)
!42 = !DILocation(line: 46, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !13, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !13, line: 47, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 48, column: 14, scope: !44)
!49 = !DILocation(line: 50, column: 18, scope: !44)
!50 = !DILocation(line: 50, column: 31, scope: !44)
!51 = !DILocation(line: 50, column: 24, scope: !44)
!52 = !DILocation(line: 50, column: 44, scope: !44)
!53 = !DILocation(line: 50, column: 9, scope: !44)
!54 = !DILocation(line: 51, column: 19, scope: !44)
!55 = !DILocation(line: 51, column: 9, scope: !44)
!56 = !DILocation(line: 52, column: 14, scope: !44)
!57 = !DILocation(line: 52, column: 9, scope: !44)
!58 = !DILocation(line: 54, column: 1, scope: !21)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_05_good", scope: !13, file: !13, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 109, column: 5, scope: !59)
!61 = !DILocation(line: 110, column: 5, scope: !59)
!62 = !DILocation(line: 111, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 123, type: !64, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!14, !14, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !13, line: 123, type: !14)
!68 = !DILocation(line: 123, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !13, line: 123, type: !66)
!70 = !DILocation(line: 123, column: 27, scope: !63)
!71 = !DILocation(line: 126, column: 22, scope: !63)
!72 = !DILocation(line: 126, column: 12, scope: !63)
!73 = !DILocation(line: 126, column: 5, scope: !63)
!74 = !DILocation(line: 128, column: 5, scope: !63)
!75 = !DILocation(line: 129, column: 5, scope: !63)
!76 = !DILocation(line: 130, column: 5, scope: !63)
!77 = !DILocation(line: 133, column: 5, scope: !63)
!78 = !DILocation(line: 134, column: 5, scope: !63)
!79 = !DILocation(line: 135, column: 5, scope: !63)
!80 = !DILocation(line: 137, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 63, type: !6)
!83 = !DILocation(line: 63, column: 12, scope: !81)
!84 = !DILocation(line: 64, column: 20, scope: !81)
!85 = !DILocation(line: 64, column: 10, scope: !81)
!86 = !DILocation(line: 65, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !13, line: 65, column: 9)
!88 = !DILocation(line: 65, column: 14, scope: !87)
!89 = !DILocation(line: 65, column: 9, scope: !81)
!90 = !DILocation(line: 65, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 65, column: 23)
!92 = !DILocation(line: 66, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !13, line: 66, column: 8)
!94 = !DILocation(line: 66, column: 8, scope: !81)
!95 = !DILocation(line: 69, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !13, line: 67, column: 5)
!97 = !DILocation(line: 70, column: 5, scope: !96)
!98 = !DILocation(line: 74, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !13, line: 72, column: 5)
!100 = !DILocation(line: 74, column: 9, scope: !99)
!101 = !DILocation(line: 75, column: 9, scope: !99)
!102 = !DILocation(line: 75, column: 20, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !13, line: 78, type: !45)
!104 = distinct !DILexicalBlock(scope: !81, file: !13, line: 77, column: 5)
!105 = !DILocation(line: 78, column: 14, scope: !104)
!106 = !DILocation(line: 80, column: 18, scope: !104)
!107 = !DILocation(line: 80, column: 31, scope: !104)
!108 = !DILocation(line: 80, column: 24, scope: !104)
!109 = !DILocation(line: 80, column: 44, scope: !104)
!110 = !DILocation(line: 80, column: 9, scope: !104)
!111 = !DILocation(line: 81, column: 19, scope: !104)
!112 = !DILocation(line: 81, column: 9, scope: !104)
!113 = !DILocation(line: 82, column: 14, scope: !104)
!114 = !DILocation(line: 82, column: 9, scope: !104)
!115 = !DILocation(line: 84, column: 1, scope: !81)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !13, line: 89, type: !6)
!118 = !DILocation(line: 89, column: 12, scope: !116)
!119 = !DILocation(line: 90, column: 20, scope: !116)
!120 = !DILocation(line: 90, column: 10, scope: !116)
!121 = !DILocation(line: 91, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !13, line: 91, column: 9)
!123 = !DILocation(line: 91, column: 14, scope: !122)
!124 = !DILocation(line: 91, column: 9, scope: !116)
!125 = !DILocation(line: 91, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 91, column: 23)
!127 = !DILocation(line: 92, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !13, line: 92, column: 8)
!129 = !DILocation(line: 92, column: 8, scope: !116)
!130 = !DILocation(line: 95, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !13, line: 93, column: 5)
!132 = !DILocation(line: 95, column: 9, scope: !131)
!133 = !DILocation(line: 96, column: 9, scope: !131)
!134 = !DILocation(line: 96, column: 20, scope: !131)
!135 = !DILocation(line: 97, column: 5, scope: !131)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !13, line: 99, type: !45)
!137 = distinct !DILexicalBlock(scope: !116, file: !13, line: 98, column: 5)
!138 = !DILocation(line: 99, column: 14, scope: !137)
!139 = !DILocation(line: 101, column: 18, scope: !137)
!140 = !DILocation(line: 101, column: 31, scope: !137)
!141 = !DILocation(line: 101, column: 24, scope: !137)
!142 = !DILocation(line: 101, column: 44, scope: !137)
!143 = !DILocation(line: 101, column: 9, scope: !137)
!144 = !DILocation(line: 102, column: 19, scope: !137)
!145 = !DILocation(line: 102, column: 9, scope: !137)
!146 = !DILocation(line: 103, column: 14, scope: !137)
!147 = !DILocation(line: 103, column: 9, scope: !137)
!148 = !DILocation(line: 105, column: 1, scope: !116)
