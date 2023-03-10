; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType* %myStruct, i32 0, i32 0, !dbg !29
  store i8* %0, i8** %structFirst, align 8, !dbg !30
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType* %myStruct, i32 0, i32 0, !dbg !31
  %1 = load i8*, i8** %coerce.dive, align 8, !dbg !31
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67b_badSink(i8* %1), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67b_badSink(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #4, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #4, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType* %myStruct, metadata !58, metadata !DIExpression()), !dbg !59
  store i8* null, i8** %data, align 8, !dbg !60
  %call = call noalias align 16 i8* @malloc(i64 11) #4, !dbg !61
  store i8* %call, i8** %data, align 8, !dbg !62
  %0 = load i8*, i8** %data, align 8, !dbg !63
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType* %myStruct, i32 0, i32 0, !dbg !64
  store i8* %0, i8** %structFirst, align 8, !dbg !65
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType* %myStruct, i32 0, i32 0, !dbg !66
  %1 = load i8*, i8** %coerce.dive, align 8, !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67b_goodG2BSink(i8* %1), !dbg !66
  ret void, !dbg !67
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_bad", scope: !14, file: !14, line: 36, type: !15, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 38, type: !4)
!18 = !DILocation(line: 38, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myStruct", scope: !13, file: !14, line: 39, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType", file: !14, line: 29, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_structType", file: !14, line: 26, size: 64, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !14, line: 28, baseType: !4, size: 64)
!24 = !DILocation(line: 39, column: 72, scope: !13)
!25 = !DILocation(line: 40, column: 10, scope: !13)
!26 = !DILocation(line: 42, column: 20, scope: !13)
!27 = !DILocation(line: 42, column: 10, scope: !13)
!28 = !DILocation(line: 43, column: 28, scope: !13)
!29 = !DILocation(line: 43, column: 14, scope: !13)
!30 = !DILocation(line: 43, column: 26, scope: !13)
!31 = !DILocation(line: 44, column: 5, scope: !13)
!32 = !DILocation(line: 45, column: 1, scope: !13)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_67_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 67, column: 5, scope: !33)
!35 = !DILocation(line: 68, column: 1, scope: !33)
!36 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 80, type: !37, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !14, line: 80, type: !39)
!42 = !DILocation(line: 80, column: 14, scope: !36)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !14, line: 80, type: !40)
!44 = !DILocation(line: 80, column: 27, scope: !36)
!45 = !DILocation(line: 83, column: 22, scope: !36)
!46 = !DILocation(line: 83, column: 12, scope: !36)
!47 = !DILocation(line: 83, column: 5, scope: !36)
!48 = !DILocation(line: 85, column: 5, scope: !36)
!49 = !DILocation(line: 86, column: 5, scope: !36)
!50 = !DILocation(line: 87, column: 5, scope: !36)
!51 = !DILocation(line: 90, column: 5, scope: !36)
!52 = !DILocation(line: 91, column: 5, scope: !36)
!53 = !DILocation(line: 92, column: 5, scope: !36)
!54 = !DILocation(line: 94, column: 5, scope: !36)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", scope: !55, file: !14, line: 56, type: !4)
!57 = !DILocation(line: 56, column: 12, scope: !55)
!58 = !DILocalVariable(name: "myStruct", scope: !55, file: !14, line: 57, type: !20)
!59 = !DILocation(line: 57, column: 72, scope: !55)
!60 = !DILocation(line: 58, column: 10, scope: !55)
!61 = !DILocation(line: 60, column: 20, scope: !55)
!62 = !DILocation(line: 60, column: 10, scope: !55)
!63 = !DILocation(line: 61, column: 28, scope: !55)
!64 = !DILocation(line: 61, column: 14, scope: !55)
!65 = !DILocation(line: 61, column: 26, scope: !55)
!66 = !DILocation(line: 62, column: 5, scope: !55)
!67 = !DILocation(line: 63, column: 1, scope: !55)
