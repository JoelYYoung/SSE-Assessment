; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !31
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !32
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !30
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !33
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !40
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !41
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !42
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !43
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !43
  call void @printLine(i8* %4), !dbg !44
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !46
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !47
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !49
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !52
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay4), !dbg !53
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !55
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !55
  call void @printLine(i8* %9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15_good() #0 !dbg !58 {
entry:
  call void @good1(), !dbg !59
  call void @good2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !81 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !82, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !85
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !86
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !84
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !87
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !93
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !94
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !95
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !96
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !97
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !97
  call void @printLine(i8* %4), !dbg !98
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !99
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !100
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !101
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !101
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !102
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !103
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !105
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !106
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !105
  call void @printLine(i8* %arraydecay4), !dbg !107
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !108
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !109
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !109
  call void @printLine(i8* %9), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !112 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !113, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !116
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !117
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !125
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !126
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !128
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !128
  call void @printLine(i8* %4), !dbg !129
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !131
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !132
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !132
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !134
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !136
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !137
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !136
  call void @printLine(i8* %arraydecay4), !dbg !138
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !139
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !140
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !140
  call void @printLine(i8* %9), !dbg !141
  ret void, !dbg !142
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
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 256, elements: !8)
!8 = !{!9, !14, !16}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 128)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 16)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !7, file: !6, line: 27, baseType: !15, size: 64, offset: 128)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !7, file: !6, line: 28, baseType: !15, size: 64, offset: 192)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !6, line: 39, type: !4)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 38, column: 5)
!30 = !DILocation(line: 39, column: 20, scope: !29)
!31 = !DILocation(line: 39, column: 49, scope: !29)
!32 = !DILocation(line: 39, column: 37, scope: !29)
!33 = !DILocation(line: 40, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !6, line: 40, column: 13)
!35 = !DILocation(line: 40, column: 28, scope: !34)
!36 = !DILocation(line: 40, column: 13, scope: !29)
!37 = !DILocation(line: 40, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !6, line: 40, column: 37)
!39 = !DILocation(line: 41, column: 9, scope: !29)
!40 = !DILocation(line: 41, column: 25, scope: !29)
!41 = !DILocation(line: 41, column: 36, scope: !29)
!42 = !DILocation(line: 43, column: 27, scope: !29)
!43 = !DILocation(line: 43, column: 43, scope: !29)
!44 = !DILocation(line: 43, column: 9, scope: !29)
!45 = !DILocation(line: 45, column: 17, scope: !29)
!46 = !DILocation(line: 45, column: 33, scope: !29)
!47 = !DILocation(line: 45, column: 9, scope: !29)
!48 = !DILocation(line: 46, column: 9, scope: !29)
!49 = !DILocation(line: 46, column: 25, scope: !29)
!50 = !DILocation(line: 46, column: 87, scope: !29)
!51 = !DILocation(line: 47, column: 27, scope: !29)
!52 = !DILocation(line: 47, column: 43, scope: !29)
!53 = !DILocation(line: 47, column: 9, scope: !29)
!54 = !DILocation(line: 48, column: 27, scope: !29)
!55 = !DILocation(line: 48, column: 43, scope: !29)
!56 = !DILocation(line: 48, column: 9, scope: !29)
!57 = !DILocation(line: 56, column: 1, scope: !25)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_15_good", scope: !6, file: !6, line: 114, type: !26, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 116, column: 5, scope: !58)
!60 = !DILocation(line: 117, column: 5, scope: !58)
!61 = !DILocation(line: 118, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 129, type: !63, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !6, line: 129, type: !65)
!68 = !DILocation(line: 129, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !6, line: 129, type: !66)
!70 = !DILocation(line: 129, column: 27, scope: !62)
!71 = !DILocation(line: 132, column: 22, scope: !62)
!72 = !DILocation(line: 132, column: 12, scope: !62)
!73 = !DILocation(line: 132, column: 5, scope: !62)
!74 = !DILocation(line: 134, column: 5, scope: !62)
!75 = !DILocation(line: 135, column: 5, scope: !62)
!76 = !DILocation(line: 136, column: 5, scope: !62)
!77 = !DILocation(line: 139, column: 5, scope: !62)
!78 = !DILocation(line: 140, column: 5, scope: !62)
!79 = !DILocation(line: 141, column: 5, scope: !62)
!80 = !DILocation(line: 143, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 63, type: !26, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "structCharVoid", scope: !83, file: !6, line: 73, type: !4)
!83 = distinct !DILexicalBlock(scope: !81, file: !6, line: 72, column: 5)
!84 = !DILocation(line: 73, column: 20, scope: !83)
!85 = !DILocation(line: 73, column: 49, scope: !83)
!86 = !DILocation(line: 73, column: 37, scope: !83)
!87 = !DILocation(line: 74, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !6, line: 74, column: 13)
!89 = !DILocation(line: 74, column: 28, scope: !88)
!90 = !DILocation(line: 74, column: 13, scope: !83)
!91 = !DILocation(line: 74, column: 38, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !6, line: 74, column: 37)
!93 = !DILocation(line: 75, column: 9, scope: !83)
!94 = !DILocation(line: 75, column: 25, scope: !83)
!95 = !DILocation(line: 75, column: 36, scope: !83)
!96 = !DILocation(line: 77, column: 27, scope: !83)
!97 = !DILocation(line: 77, column: 43, scope: !83)
!98 = !DILocation(line: 77, column: 9, scope: !83)
!99 = !DILocation(line: 79, column: 17, scope: !83)
!100 = !DILocation(line: 79, column: 33, scope: !83)
!101 = !DILocation(line: 79, column: 9, scope: !83)
!102 = !DILocation(line: 80, column: 9, scope: !83)
!103 = !DILocation(line: 80, column: 25, scope: !83)
!104 = !DILocation(line: 80, column: 87, scope: !83)
!105 = !DILocation(line: 81, column: 27, scope: !83)
!106 = !DILocation(line: 81, column: 43, scope: !83)
!107 = !DILocation(line: 81, column: 9, scope: !83)
!108 = !DILocation(line: 82, column: 27, scope: !83)
!109 = !DILocation(line: 82, column: 43, scope: !83)
!110 = !DILocation(line: 82, column: 9, scope: !83)
!111 = !DILocation(line: 86, column: 1, scope: !81)
!112 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 89, type: !26, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "structCharVoid", scope: !114, file: !6, line: 95, type: !4)
!114 = distinct !DILexicalBlock(scope: !112, file: !6, line: 94, column: 5)
!115 = !DILocation(line: 95, column: 20, scope: !114)
!116 = !DILocation(line: 95, column: 49, scope: !114)
!117 = !DILocation(line: 95, column: 37, scope: !114)
!118 = !DILocation(line: 96, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !6, line: 96, column: 13)
!120 = !DILocation(line: 96, column: 28, scope: !119)
!121 = !DILocation(line: 96, column: 13, scope: !114)
!122 = !DILocation(line: 96, column: 38, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !6, line: 96, column: 37)
!124 = !DILocation(line: 97, column: 9, scope: !114)
!125 = !DILocation(line: 97, column: 25, scope: !114)
!126 = !DILocation(line: 97, column: 36, scope: !114)
!127 = !DILocation(line: 99, column: 27, scope: !114)
!128 = !DILocation(line: 99, column: 43, scope: !114)
!129 = !DILocation(line: 99, column: 9, scope: !114)
!130 = !DILocation(line: 101, column: 17, scope: !114)
!131 = !DILocation(line: 101, column: 33, scope: !114)
!132 = !DILocation(line: 101, column: 9, scope: !114)
!133 = !DILocation(line: 102, column: 9, scope: !114)
!134 = !DILocation(line: 102, column: 25, scope: !114)
!135 = !DILocation(line: 102, column: 87, scope: !114)
!136 = !DILocation(line: 103, column: 27, scope: !114)
!137 = !DILocation(line: 103, column: 43, scope: !114)
!138 = !DILocation(line: 103, column: 9, scope: !114)
!139 = !DILocation(line: 104, column: 27, scope: !114)
!140 = !DILocation(line: 104, column: 43, scope: !114)
!141 = !DILocation(line: 104, column: 9, scope: !114)
!142 = !DILocation(line: 112, column: 1, scope: !112)
