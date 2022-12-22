; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !28
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %while.body
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !39
  store i32 1, i32* %intOne, align 4, !dbg !40
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !42
  store i32 2, i32* %intTwo, align 4, !dbg !43
  br label %while.end, !dbg !44

while.end:                                        ; preds = %if.end
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !45
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !46
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !47
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !47
  call void @free(i8* %6) #5, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !76
  br label %while.body, !dbg !77

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !78
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !80
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %while.body
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !89
  store i32 1, i32* %intOne, align 4, !dbg !90
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !92
  store i32 2, i32* %intTwo, align 4, !dbg !93
  br label %while.end, !dbg !94

while.end:                                        ; preds = %if.end
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !95
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !96
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !97
  call void @free(i8* %6) #5, !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 25, column: 10, scope: !20)
!27 = !DILocation(line: 26, column: 5, scope: !20)
!28 = !DILocation(line: 30, column: 33, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 5)
!30 = !DILocation(line: 30, column: 16, scope: !29)
!31 = !DILocation(line: 30, column: 14, scope: !29)
!32 = !DILocation(line: 31, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !21, line: 31, column: 13)
!34 = !DILocation(line: 31, column: 18, scope: !33)
!35 = !DILocation(line: 31, column: 13, scope: !29)
!36 = !DILocation(line: 31, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 31, column: 27)
!38 = !DILocation(line: 32, column: 9, scope: !29)
!39 = !DILocation(line: 32, column: 15, scope: !29)
!40 = !DILocation(line: 32, column: 22, scope: !29)
!41 = !DILocation(line: 33, column: 9, scope: !29)
!42 = !DILocation(line: 33, column: 15, scope: !29)
!43 = !DILocation(line: 33, column: 22, scope: !29)
!44 = !DILocation(line: 34, column: 9, scope: !29)
!45 = !DILocation(line: 37, column: 21, scope: !20)
!46 = !DILocation(line: 37, column: 5, scope: !20)
!47 = !DILocation(line: 38, column: 10, scope: !20)
!48 = !DILocation(line: 38, column: 5, scope: !20)
!49 = !DILocation(line: 39, column: 1, scope: !20)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_16_good", scope: !21, file: !21, line: 65, type: !22, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 67, column: 5, scope: !50)
!52 = !DILocation(line: 68, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 80, type: !54, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!10, !10, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !21, line: 80, type: !10)
!60 = !DILocation(line: 80, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !21, line: 80, type: !56)
!62 = !DILocation(line: 80, column: 27, scope: !53)
!63 = !DILocation(line: 83, column: 22, scope: !53)
!64 = !DILocation(line: 83, column: 12, scope: !53)
!65 = !DILocation(line: 83, column: 5, scope: !53)
!66 = !DILocation(line: 85, column: 5, scope: !53)
!67 = !DILocation(line: 86, column: 5, scope: !53)
!68 = !DILocation(line: 87, column: 5, scope: !53)
!69 = !DILocation(line: 90, column: 5, scope: !53)
!70 = !DILocation(line: 91, column: 5, scope: !53)
!71 = !DILocation(line: 92, column: 5, scope: !53)
!72 = !DILocation(line: 94, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 46, type: !22, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !21, line: 48, type: !4)
!75 = !DILocation(line: 48, column: 21, scope: !73)
!76 = !DILocation(line: 50, column: 10, scope: !73)
!77 = !DILocation(line: 51, column: 5, scope: !73)
!78 = !DILocation(line: 54, column: 33, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !21, line: 52, column: 5)
!80 = !DILocation(line: 54, column: 16, scope: !79)
!81 = !DILocation(line: 54, column: 14, scope: !79)
!82 = !DILocation(line: 55, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !21, line: 55, column: 13)
!84 = !DILocation(line: 55, column: 18, scope: !83)
!85 = !DILocation(line: 55, column: 13, scope: !79)
!86 = !DILocation(line: 55, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !21, line: 55, column: 27)
!88 = !DILocation(line: 56, column: 9, scope: !79)
!89 = !DILocation(line: 56, column: 15, scope: !79)
!90 = !DILocation(line: 56, column: 22, scope: !79)
!91 = !DILocation(line: 57, column: 9, scope: !79)
!92 = !DILocation(line: 57, column: 15, scope: !79)
!93 = !DILocation(line: 57, column: 22, scope: !79)
!94 = !DILocation(line: 58, column: 9, scope: !79)
!95 = !DILocation(line: 61, column: 21, scope: !73)
!96 = !DILocation(line: 61, column: 5, scope: !73)
!97 = !DILocation(line: 62, column: 10, scope: !73)
!98 = !DILocation(line: 62, column: 5, scope: !73)
!99 = !DILocation(line: 63, column: 1, scope: !73)
