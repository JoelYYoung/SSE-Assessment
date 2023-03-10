; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType* %myStruct, metadata !22, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !41
  store i32* %3, i32** %structFirst, align 8, !dbg !42
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !43
  %4 = load i32*, i32** %coerce.dive, align 8, !dbg !43
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67b_badSink(i32* %4), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67b_badSink(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType* %myStruct, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !75
  store i32* %0, i32** %data, align 8, !dbg !76
  %1 = load i32*, i32** %data, align 8, !dbg !77
  %cmp = icmp eq i32* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !86
  store i32* %3, i32** %structFirst, align 8, !dbg !87
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !88
  %4 = load i32*, i32** %coerce.dive, align 8, !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67b_goodG2BSink(i32* %4), !dbg !88
  ret void, !dbg !89
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67b_goodG2BSink(i32*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67a.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myStruct", scope: !16, file: !17, line: 40, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType", file: !17, line: 30, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_structType", file: !17, line: 27, size: 64, elements: !25)
!25 = !{!26}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !24, file: !17, line: 29, baseType: !4, size: 64)
!27 = !DILocation(line: 40, column: 80, scope: !16)
!28 = !DILocation(line: 41, column: 10, scope: !16)
!29 = !DILocation(line: 43, column: 23, scope: !16)
!30 = !DILocation(line: 43, column: 12, scope: !16)
!31 = !DILocation(line: 43, column: 10, scope: !16)
!32 = !DILocation(line: 44, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 9)
!34 = !DILocation(line: 44, column: 14, scope: !33)
!35 = !DILocation(line: 44, column: 9, scope: !16)
!36 = !DILocation(line: 44, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 44, column: 23)
!38 = !DILocation(line: 45, column: 5, scope: !16)
!39 = !DILocation(line: 45, column: 13, scope: !16)
!40 = !DILocation(line: 46, column: 28, scope: !16)
!41 = !DILocation(line: 46, column: 14, scope: !16)
!42 = !DILocation(line: 46, column: 26, scope: !16)
!43 = !DILocation(line: 47, column: 5, scope: !16)
!44 = !DILocation(line: 48, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_67_good", scope: !17, file: !17, line: 70, type: !18, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 72, column: 5, scope: !45)
!47 = !DILocation(line: 73, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 85, type: !49, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !17, line: 85, type: !7)
!55 = !DILocation(line: 85, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !17, line: 85, type: !51)
!57 = !DILocation(line: 85, column: 27, scope: !48)
!58 = !DILocation(line: 88, column: 22, scope: !48)
!59 = !DILocation(line: 88, column: 12, scope: !48)
!60 = !DILocation(line: 88, column: 5, scope: !48)
!61 = !DILocation(line: 90, column: 5, scope: !48)
!62 = !DILocation(line: 91, column: 5, scope: !48)
!63 = !DILocation(line: 92, column: 5, scope: !48)
!64 = !DILocation(line: 95, column: 5, scope: !48)
!65 = !DILocation(line: 96, column: 5, scope: !48)
!66 = !DILocation(line: 97, column: 5, scope: !48)
!67 = !DILocation(line: 99, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !17, line: 59, type: !4)
!70 = !DILocation(line: 59, column: 15, scope: !68)
!71 = !DILocalVariable(name: "myStruct", scope: !68, file: !17, line: 60, type: !23)
!72 = !DILocation(line: 60, column: 80, scope: !68)
!73 = !DILocation(line: 61, column: 10, scope: !68)
!74 = !DILocation(line: 63, column: 23, scope: !68)
!75 = !DILocation(line: 63, column: 12, scope: !68)
!76 = !DILocation(line: 63, column: 10, scope: !68)
!77 = !DILocation(line: 64, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !68, file: !17, line: 64, column: 9)
!79 = !DILocation(line: 64, column: 14, scope: !78)
!80 = !DILocation(line: 64, column: 9, scope: !68)
!81 = !DILocation(line: 64, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !17, line: 64, column: 23)
!83 = !DILocation(line: 65, column: 5, scope: !68)
!84 = !DILocation(line: 65, column: 13, scope: !68)
!85 = !DILocation(line: 66, column: 28, scope: !68)
!86 = !DILocation(line: 66, column: 14, scope: !68)
!87 = !DILocation(line: 66, column: 26, scope: !68)
!88 = !DILocation(line: 67, column: 5, scope: !68)
!89 = !DILocation(line: 68, column: 1, scope: !68)
