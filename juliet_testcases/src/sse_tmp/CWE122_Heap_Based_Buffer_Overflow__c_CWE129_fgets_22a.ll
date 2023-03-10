; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Global = dso_local global i32 0, align 4, !dbg !9
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Global = dso_local global i32 0, align 4, !dbg !13
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BGlobal = dso_local global i32 0, align 4, !dbg !15
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !29, metadata !DIExpression()), !dbg !35
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !39
  %cmp = icmp ne i8* %call, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !42
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !44
  store i32 %call2, i32* %data, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badGlobal, align 4, !dbg !49
  %2 = load i32, i32* %data, align 4, !dbg !50
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badSink(i32 %2), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badSink(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_good() #0 !dbg !53 {
entry:
  call void @goodB2G1(), !dbg !54
  call void @goodB2G2(), !dbg !55
  call void @goodG2B(), !dbg !56
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !81, metadata !DIExpression()), !dbg !83
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !83
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !84
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !86
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !87
  %cmp = icmp ne i8* %call, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !90
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !92
  store i32 %call2, i32* %data, align 4, !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Global, align 4, !dbg !97
  %2 = load i32, i32* %data, align 4, !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Sink(i32 %2), !dbg !99
  ret void, !dbg !100
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Sink(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %data, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !108
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !110
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !111
  %cmp = icmp ne i8* %call, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !114
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !116
  store i32 %call2, i32* %data, align 4, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Global, align 4, !dbg !121
  %2 = load i32, i32* %data, align 4, !dbg !122
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Sink(i32 %2), !dbg !123
  ret void, !dbg !124
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Sink(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !125 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 -1, i32* %data, align 4, !dbg !128
  store i32 7, i32* %data, align 4, !dbg !129
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BGlobal, align 4, !dbg !130
  %0 = load i32, i32* %data, align 4, !dbg !131
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BSink(i32 %0), !dbg !132
  ret void, !dbg !133
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BSink(i32) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badGlobal", scope: !2, file: !11, line: 25, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13, !15}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Global", scope: !2, file: !11, line: 56, type: !12, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22a.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Global", scope: !2, file: !11, line: 57, type: !12, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BGlobal", scope: !2, file: !11, line: 58, type: !12, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_bad", scope: !11, file: !11, line: 29, type: !24, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !11, line: 31, type: !12)
!27 = !DILocation(line: 31, column: 9, scope: !23)
!28 = !DILocation(line: 33, column: 10, scope: !23)
!29 = !DILocalVariable(name: "inputBuffer", scope: !30, file: !11, line: 35, type: !31)
!30 = distinct !DILexicalBlock(scope: !23, file: !11, line: 34, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 112, elements: !33)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 14)
!35 = !DILocation(line: 35, column: 14, scope: !30)
!36 = !DILocation(line: 37, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 13)
!38 = !DILocation(line: 37, column: 49, scope: !37)
!39 = !DILocation(line: 37, column: 13, scope: !37)
!40 = !DILocation(line: 37, column: 56, scope: !37)
!41 = !DILocation(line: 37, column: 13, scope: !30)
!42 = !DILocation(line: 40, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !11, line: 38, column: 9)
!44 = !DILocation(line: 40, column: 20, scope: !43)
!45 = !DILocation(line: 40, column: 18, scope: !43)
!46 = !DILocation(line: 41, column: 9, scope: !43)
!47 = !DILocation(line: 44, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !11, line: 43, column: 9)
!49 = !DILocation(line: 47, column: 68, scope: !23)
!50 = !DILocation(line: 48, column: 66, scope: !23)
!51 = !DILocation(line: 48, column: 5, scope: !23)
!52 = !DILocation(line: 49, column: 1, scope: !23)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_good", scope: !11, file: !11, line: 125, type: !24, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 127, column: 5, scope: !53)
!55 = !DILocation(line: 128, column: 5, scope: !53)
!56 = !DILocation(line: 129, column: 5, scope: !53)
!57 = !DILocation(line: 130, column: 1, scope: !53)
!58 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 141, type: !59, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!12, !12, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !11, line: 141, type: !12)
!64 = !DILocation(line: 141, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !11, line: 141, type: !61)
!66 = !DILocation(line: 141, column: 27, scope: !58)
!67 = !DILocation(line: 144, column: 22, scope: !58)
!68 = !DILocation(line: 144, column: 12, scope: !58)
!69 = !DILocation(line: 144, column: 5, scope: !58)
!70 = !DILocation(line: 146, column: 5, scope: !58)
!71 = !DILocation(line: 147, column: 5, scope: !58)
!72 = !DILocation(line: 148, column: 5, scope: !58)
!73 = !DILocation(line: 151, column: 5, scope: !58)
!74 = !DILocation(line: 152, column: 5, scope: !58)
!75 = !DILocation(line: 153, column: 5, scope: !58)
!76 = !DILocation(line: 155, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 63, type: !24, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !11, line: 65, type: !12)
!79 = !DILocation(line: 65, column: 9, scope: !77)
!80 = !DILocation(line: 67, column: 10, scope: !77)
!81 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !11, line: 69, type: !31)
!82 = distinct !DILexicalBlock(scope: !77, file: !11, line: 68, column: 5)
!83 = !DILocation(line: 69, column: 14, scope: !82)
!84 = !DILocation(line: 71, column: 19, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !11, line: 71, column: 13)
!86 = !DILocation(line: 71, column: 49, scope: !85)
!87 = !DILocation(line: 71, column: 13, scope: !85)
!88 = !DILocation(line: 71, column: 56, scope: !85)
!89 = !DILocation(line: 71, column: 13, scope: !82)
!90 = !DILocation(line: 74, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !11, line: 72, column: 9)
!92 = !DILocation(line: 74, column: 20, scope: !91)
!93 = !DILocation(line: 74, column: 18, scope: !91)
!94 = !DILocation(line: 75, column: 9, scope: !91)
!95 = !DILocation(line: 78, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !85, file: !11, line: 77, column: 9)
!97 = !DILocation(line: 81, column: 73, scope: !77)
!98 = !DILocation(line: 82, column: 71, scope: !77)
!99 = !DILocation(line: 82, column: 5, scope: !77)
!100 = !DILocation(line: 83, column: 1, scope: !77)
!101 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 88, type: !24, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !11, line: 90, type: !12)
!103 = !DILocation(line: 90, column: 9, scope: !101)
!104 = !DILocation(line: 92, column: 10, scope: !101)
!105 = !DILocalVariable(name: "inputBuffer", scope: !106, file: !11, line: 94, type: !31)
!106 = distinct !DILexicalBlock(scope: !101, file: !11, line: 93, column: 5)
!107 = !DILocation(line: 94, column: 14, scope: !106)
!108 = !DILocation(line: 96, column: 19, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !11, line: 96, column: 13)
!110 = !DILocation(line: 96, column: 49, scope: !109)
!111 = !DILocation(line: 96, column: 13, scope: !109)
!112 = !DILocation(line: 96, column: 56, scope: !109)
!113 = !DILocation(line: 96, column: 13, scope: !106)
!114 = !DILocation(line: 99, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !11, line: 97, column: 9)
!116 = !DILocation(line: 99, column: 20, scope: !115)
!117 = !DILocation(line: 99, column: 18, scope: !115)
!118 = !DILocation(line: 100, column: 9, scope: !115)
!119 = !DILocation(line: 103, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !11, line: 102, column: 9)
!121 = !DILocation(line: 106, column: 73, scope: !101)
!122 = !DILocation(line: 107, column: 71, scope: !101)
!123 = !DILocation(line: 107, column: 5, scope: !101)
!124 = !DILocation(line: 108, column: 1, scope: !101)
!125 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 113, type: !24, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !11, line: 115, type: !12)
!127 = !DILocation(line: 115, column: 9, scope: !125)
!128 = !DILocation(line: 117, column: 10, scope: !125)
!129 = !DILocation(line: 120, column: 10, scope: !125)
!130 = !DILocation(line: 121, column: 72, scope: !125)
!131 = !DILocation(line: 122, column: 70, scope: !125)
!132 = !DILocation(line: 122, column: 5, scope: !125)
!133 = !DILocation(line: 123, column: 1, scope: !125)
