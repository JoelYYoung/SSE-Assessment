; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !26, metadata !DIExpression()), !dbg !32
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !35
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !36
  %cmp = icmp ne i8* %call, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !41
  store i32 %call2, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !46
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !47
  store i32 %2, i32* %structFirst, align 4, !dbg !48
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !49
  %3 = load i32, i32* %coerce.dive, align 4, !dbg !49
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67b_badSink(i32 %3), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67b_badSink(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  call void @goodB2G(), !dbg !53
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  store i32 7, i32* %data, align 4, !dbg !80
  %0 = load i32, i32* %data, align 4, !dbg !81
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !82
  store i32 %0, i32* %structFirst, align 4, !dbg !83
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !84
  %1 = load i32, i32* %coerce.dive, align 4, !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67b_goodG2BSink(i32 %1), !dbg !84
  ret void, !dbg !85
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67b_goodG2BSink(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !86 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !95
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !97
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !98
  %cmp = icmp ne i8* %call, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !101
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !103
  store i32 %call2, i32* %data, align 4, !dbg !104
  br label %if.end, !dbg !105

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !106
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !108
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !109
  store i32 %2, i32* %structFirst, align 4, !dbg !110
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !111
  %3 = load i32, i32* %coerce.dive, align 4, !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67b_goodB2GSink(i32 %3), !dbg !111
  ret void, !dbg !112
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67b_goodB2GSink(i32) #3

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67a.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_bad", scope: !13, file: !13, line: 32, type: !14, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 34, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 34, column: 9, scope: !12)
!19 = !DILocalVariable(name: "myStruct", scope: !12, file: !13, line: 35, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType", file: !13, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_structType", file: !13, line: 22, size: 32, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !13, line: 24, baseType: !17, size: 32)
!24 = !DILocation(line: 35, column: 69, scope: !12)
!25 = !DILocation(line: 37, column: 10, scope: !12)
!26 = !DILocalVariable(name: "inputBuffer", scope: !27, file: !13, line: 39, type: !28)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 38, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 39, column: 14, scope: !27)
!33 = !DILocation(line: 41, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !13, line: 41, column: 13)
!35 = !DILocation(line: 41, column: 49, scope: !34)
!36 = !DILocation(line: 41, column: 13, scope: !34)
!37 = !DILocation(line: 41, column: 56, scope: !34)
!38 = !DILocation(line: 41, column: 13, scope: !27)
!39 = !DILocation(line: 44, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !13, line: 42, column: 9)
!41 = !DILocation(line: 44, column: 20, scope: !40)
!42 = !DILocation(line: 44, column: 18, scope: !40)
!43 = !DILocation(line: 45, column: 9, scope: !40)
!44 = !DILocation(line: 48, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !13, line: 47, column: 9)
!46 = !DILocation(line: 51, column: 28, scope: !12)
!47 = !DILocation(line: 51, column: 14, scope: !12)
!48 = !DILocation(line: 51, column: 26, scope: !12)
!49 = !DILocation(line: 52, column: 5, scope: !12)
!50 = !DILocation(line: 53, column: 1, scope: !12)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_67_good", scope: !13, file: !13, line: 101, type: !14, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 103, column: 5, scope: !51)
!53 = !DILocation(line: 104, column: 5, scope: !51)
!54 = !DILocation(line: 105, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 116, type: !56, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!17, !17, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !13, line: 116, type: !17)
!61 = !DILocation(line: 116, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !13, line: 116, type: !58)
!63 = !DILocation(line: 116, column: 27, scope: !55)
!64 = !DILocation(line: 119, column: 22, scope: !55)
!65 = !DILocation(line: 119, column: 12, scope: !55)
!66 = !DILocation(line: 119, column: 5, scope: !55)
!67 = !DILocation(line: 121, column: 5, scope: !55)
!68 = !DILocation(line: 122, column: 5, scope: !55)
!69 = !DILocation(line: 123, column: 5, scope: !55)
!70 = !DILocation(line: 126, column: 5, scope: !55)
!71 = !DILocation(line: 127, column: 5, scope: !55)
!72 = !DILocation(line: 128, column: 5, scope: !55)
!73 = !DILocation(line: 130, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 62, type: !14, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !13, line: 64, type: !17)
!76 = !DILocation(line: 64, column: 9, scope: !74)
!77 = !DILocalVariable(name: "myStruct", scope: !74, file: !13, line: 65, type: !20)
!78 = !DILocation(line: 65, column: 69, scope: !74)
!79 = !DILocation(line: 67, column: 10, scope: !74)
!80 = !DILocation(line: 70, column: 10, scope: !74)
!81 = !DILocation(line: 71, column: 28, scope: !74)
!82 = !DILocation(line: 71, column: 14, scope: !74)
!83 = !DILocation(line: 71, column: 26, scope: !74)
!84 = !DILocation(line: 72, column: 5, scope: !74)
!85 = !DILocation(line: 73, column: 1, scope: !74)
!86 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 78, type: !14, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !13, line: 80, type: !17)
!88 = !DILocation(line: 80, column: 9, scope: !86)
!89 = !DILocalVariable(name: "myStruct", scope: !86, file: !13, line: 81, type: !20)
!90 = !DILocation(line: 81, column: 69, scope: !86)
!91 = !DILocation(line: 83, column: 10, scope: !86)
!92 = !DILocalVariable(name: "inputBuffer", scope: !93, file: !13, line: 85, type: !28)
!93 = distinct !DILexicalBlock(scope: !86, file: !13, line: 84, column: 5)
!94 = !DILocation(line: 85, column: 14, scope: !93)
!95 = !DILocation(line: 87, column: 19, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !13, line: 87, column: 13)
!97 = !DILocation(line: 87, column: 49, scope: !96)
!98 = !DILocation(line: 87, column: 13, scope: !96)
!99 = !DILocation(line: 87, column: 56, scope: !96)
!100 = !DILocation(line: 87, column: 13, scope: !93)
!101 = !DILocation(line: 90, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !13, line: 88, column: 9)
!103 = !DILocation(line: 90, column: 20, scope: !102)
!104 = !DILocation(line: 90, column: 18, scope: !102)
!105 = !DILocation(line: 91, column: 9, scope: !102)
!106 = !DILocation(line: 94, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !96, file: !13, line: 93, column: 9)
!108 = !DILocation(line: 97, column: 28, scope: !86)
!109 = !DILocation(line: 97, column: 14, scope: !86)
!110 = !DILocation(line: 97, column: 26, scope: !86)
!111 = !DILocation(line: 98, column: 5, scope: !86)
!112 = !DILocation(line: 99, column: 1, scope: !86)
