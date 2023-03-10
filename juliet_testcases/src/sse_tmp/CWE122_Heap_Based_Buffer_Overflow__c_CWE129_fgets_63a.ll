; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !26
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !27
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !30
  %cmp = icmp ne i8* %call, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !35
  store i32 %call2, i32* %data, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63b_badSink(i32* %data), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  call void @goodB2G(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #7, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #7, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %data, align 4, !dbg !68
  store i32 7, i32* %data, align 4, !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63b_goodG2BSink(i32* %data), !dbg !70
  ret void, !dbg !71
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63b_goodG2BSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !76, metadata !DIExpression()), !dbg !78
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !78
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !79
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !81
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !82
  %cmp = icmp ne i8* %call, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !85
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !87
  store i32 %call2, i32* %data, align 4, !dbg !88
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63b_goodB2GSink(i32* %data), !dbg !92
  ret void, !dbg !93
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63b_goodB2GSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63_bad", scope: !13, file: !13, line: 27, type: !14, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 29, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 29, column: 9, scope: !12)
!19 = !DILocation(line: 31, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 33, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 33, column: 14, scope: !21)
!27 = !DILocation(line: 35, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 35, column: 13)
!29 = !DILocation(line: 35, column: 49, scope: !28)
!30 = !DILocation(line: 35, column: 13, scope: !28)
!31 = !DILocation(line: 35, column: 56, scope: !28)
!32 = !DILocation(line: 35, column: 13, scope: !21)
!33 = !DILocation(line: 38, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 36, column: 9)
!35 = !DILocation(line: 38, column: 20, scope: !34)
!36 = !DILocation(line: 38, column: 18, scope: !34)
!37 = !DILocation(line: 39, column: 9, scope: !34)
!38 = !DILocation(line: 42, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 41, column: 9)
!40 = !DILocation(line: 45, column: 5, scope: !12)
!41 = !DILocation(line: 46, column: 1, scope: !12)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_63_good", scope: !13, file: !13, line: 90, type: !14, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 92, column: 5, scope: !42)
!44 = !DILocation(line: 93, column: 5, scope: !42)
!45 = !DILocation(line: 94, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 105, type: !47, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!17, !17, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !13, line: 105, type: !17)
!52 = !DILocation(line: 105, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !13, line: 105, type: !49)
!54 = !DILocation(line: 105, column: 27, scope: !46)
!55 = !DILocation(line: 108, column: 22, scope: !46)
!56 = !DILocation(line: 108, column: 12, scope: !46)
!57 = !DILocation(line: 108, column: 5, scope: !46)
!58 = !DILocation(line: 110, column: 5, scope: !46)
!59 = !DILocation(line: 111, column: 5, scope: !46)
!60 = !DILocation(line: 112, column: 5, scope: !46)
!61 = !DILocation(line: 115, column: 5, scope: !46)
!62 = !DILocation(line: 116, column: 5, scope: !46)
!63 = !DILocation(line: 117, column: 5, scope: !46)
!64 = !DILocation(line: 119, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 55, type: !14, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !13, line: 57, type: !17)
!67 = !DILocation(line: 57, column: 9, scope: !65)
!68 = !DILocation(line: 59, column: 10, scope: !65)
!69 = !DILocation(line: 62, column: 10, scope: !65)
!70 = !DILocation(line: 63, column: 5, scope: !65)
!71 = !DILocation(line: 64, column: 1, scope: !65)
!72 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 69, type: !14, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !13, line: 71, type: !17)
!74 = !DILocation(line: 71, column: 9, scope: !72)
!75 = !DILocation(line: 73, column: 10, scope: !72)
!76 = !DILocalVariable(name: "inputBuffer", scope: !77, file: !13, line: 75, type: !22)
!77 = distinct !DILexicalBlock(scope: !72, file: !13, line: 74, column: 5)
!78 = !DILocation(line: 75, column: 14, scope: !77)
!79 = !DILocation(line: 77, column: 19, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !13, line: 77, column: 13)
!81 = !DILocation(line: 77, column: 49, scope: !80)
!82 = !DILocation(line: 77, column: 13, scope: !80)
!83 = !DILocation(line: 77, column: 56, scope: !80)
!84 = !DILocation(line: 77, column: 13, scope: !77)
!85 = !DILocation(line: 80, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !13, line: 78, column: 9)
!87 = !DILocation(line: 80, column: 20, scope: !86)
!88 = !DILocation(line: 80, column: 18, scope: !86)
!89 = !DILocation(line: 81, column: 9, scope: !86)
!90 = !DILocation(line: 84, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !13, line: 83, column: 9)
!92 = !DILocation(line: 87, column: 5, scope: !72)
!93 = !DILocation(line: 88, column: 1, scope: !72)
