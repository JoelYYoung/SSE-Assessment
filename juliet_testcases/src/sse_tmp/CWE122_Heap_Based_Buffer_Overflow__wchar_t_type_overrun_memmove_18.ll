; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %sink, !dbg !30

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !31), !dbg !32
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !33, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !36
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !37
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !35
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !38
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #7, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %sink
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !45
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !46
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !47
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !48
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !48
  %5 = bitcast i8* %4 to i32*, !dbg !49
  call void @printWLine(i32* %5), !dbg !50
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !52
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !53
  %7 = bitcast i32* %arraydecay to i8*, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !53
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !55
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !58
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !57
  call void @printWLine(i32* %arraydecay4), !dbg !59
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !60
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !61
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !61
  %12 = bitcast i8* %11 to i32*, !dbg !62
  call void @printWLine(i32* %12), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18_good() #0 !dbg !65 {
entry:
  call void @good1(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !88 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %sink, !dbg !89

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !90), !dbg !91
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !92, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !95
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !96
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !94
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !97
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %sink
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !104
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !105
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !107
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !107
  %5 = bitcast i8* %4 to i32*, !dbg !108
  call void @printWLine(i32* %5), !dbg !109
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !111
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !112
  %7 = bitcast i32* %arraydecay to i8*, !dbg !112
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !112
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !114
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !116
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !117
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !116
  call void @printWLine(i32* %arraydecay4), !dbg !118
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !120
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !120
  %12 = bitcast i8* %11 to i32*, !dbg !121
  call void @printWLine(i32* %12), !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!15}
!15 = !DISubrange(count: 16)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !7, file: !6, line: 27, baseType: !17, size: 64, offset: 512)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !7, file: !6, line: 28, baseType: !17, size: 64, offset: 576)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"clang version 13.0.0"}
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 35, column: 5, scope: !27)
!31 = !DILabel(scope: !27, name: "sink", file: !6, line: 36)
!32 = !DILocation(line: 36, column: 1, scope: !27)
!33 = !DILocalVariable(name: "structCharVoid", scope: !34, file: !6, line: 38, type: !4)
!34 = distinct !DILexicalBlock(scope: !27, file: !6, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 20, scope: !34)
!36 = !DILocation(line: 38, column: 49, scope: !34)
!37 = !DILocation(line: 38, column: 37, scope: !34)
!38 = !DILocation(line: 39, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !6, line: 39, column: 13)
!40 = !DILocation(line: 39, column: 28, scope: !39)
!41 = !DILocation(line: 39, column: 13, scope: !34)
!42 = !DILocation(line: 39, column: 38, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !6, line: 39, column: 37)
!44 = !DILocation(line: 40, column: 9, scope: !34)
!45 = !DILocation(line: 40, column: 25, scope: !34)
!46 = !DILocation(line: 40, column: 36, scope: !34)
!47 = !DILocation(line: 42, column: 31, scope: !34)
!48 = !DILocation(line: 42, column: 47, scope: !34)
!49 = !DILocation(line: 42, column: 20, scope: !34)
!50 = !DILocation(line: 42, column: 9, scope: !34)
!51 = !DILocation(line: 44, column: 17, scope: !34)
!52 = !DILocation(line: 44, column: 33, scope: !34)
!53 = !DILocation(line: 44, column: 9, scope: !34)
!54 = !DILocation(line: 45, column: 9, scope: !34)
!55 = !DILocation(line: 45, column: 25, scope: !34)
!56 = !DILocation(line: 45, column: 90, scope: !34)
!57 = !DILocation(line: 46, column: 31, scope: !34)
!58 = !DILocation(line: 46, column: 47, scope: !34)
!59 = !DILocation(line: 46, column: 9, scope: !34)
!60 = !DILocation(line: 47, column: 31, scope: !34)
!61 = !DILocation(line: 47, column: 47, scope: !34)
!62 = !DILocation(line: 47, column: 20, scope: !34)
!63 = !DILocation(line: 47, column: 9, scope: !34)
!64 = !DILocation(line: 49, column: 1, scope: !27)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_18_good", scope: !6, file: !6, line: 74, type: !28, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 76, column: 5, scope: !65)
!67 = !DILocation(line: 77, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 88, type: !69, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!13, !13, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !6, line: 88, type: !13)
!75 = !DILocation(line: 88, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !6, line: 88, type: !71)
!77 = !DILocation(line: 88, column: 27, scope: !68)
!78 = !DILocation(line: 91, column: 22, scope: !68)
!79 = !DILocation(line: 91, column: 12, scope: !68)
!80 = !DILocation(line: 91, column: 5, scope: !68)
!81 = !DILocation(line: 93, column: 5, scope: !68)
!82 = !DILocation(line: 94, column: 5, scope: !68)
!83 = !DILocation(line: 95, column: 5, scope: !68)
!84 = !DILocation(line: 98, column: 5, scope: !68)
!85 = !DILocation(line: 99, column: 5, scope: !68)
!86 = !DILocation(line: 100, column: 5, scope: !68)
!87 = !DILocation(line: 102, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 56, type: !28, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 58, column: 5, scope: !88)
!90 = !DILabel(scope: !88, name: "sink", file: !6, line: 59)
!91 = !DILocation(line: 59, column: 1, scope: !88)
!92 = !DILocalVariable(name: "structCharVoid", scope: !93, file: !6, line: 61, type: !4)
!93 = distinct !DILexicalBlock(scope: !88, file: !6, line: 60, column: 5)
!94 = !DILocation(line: 61, column: 20, scope: !93)
!95 = !DILocation(line: 61, column: 49, scope: !93)
!96 = !DILocation(line: 61, column: 37, scope: !93)
!97 = !DILocation(line: 62, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !6, line: 62, column: 13)
!99 = !DILocation(line: 62, column: 28, scope: !98)
!100 = !DILocation(line: 62, column: 13, scope: !93)
!101 = !DILocation(line: 62, column: 38, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !6, line: 62, column: 37)
!103 = !DILocation(line: 63, column: 9, scope: !93)
!104 = !DILocation(line: 63, column: 25, scope: !93)
!105 = !DILocation(line: 63, column: 36, scope: !93)
!106 = !DILocation(line: 65, column: 31, scope: !93)
!107 = !DILocation(line: 65, column: 47, scope: !93)
!108 = !DILocation(line: 65, column: 20, scope: !93)
!109 = !DILocation(line: 65, column: 9, scope: !93)
!110 = !DILocation(line: 67, column: 17, scope: !93)
!111 = !DILocation(line: 67, column: 33, scope: !93)
!112 = !DILocation(line: 67, column: 9, scope: !93)
!113 = !DILocation(line: 68, column: 9, scope: !93)
!114 = !DILocation(line: 68, column: 25, scope: !93)
!115 = !DILocation(line: 68, column: 90, scope: !93)
!116 = !DILocation(line: 69, column: 31, scope: !93)
!117 = !DILocation(line: 69, column: 47, scope: !93)
!118 = !DILocation(line: 69, column: 9, scope: !93)
!119 = !DILocation(line: 70, column: 31, scope: !93)
!120 = !DILocation(line: 70, column: 47, scope: !93)
!121 = !DILocation(line: 70, column: 20, scope: !93)
!122 = !DILocation(line: 70, column: 9, scope: !93)
!123 = !DILocation(line: 72, column: 1, scope: !88)
