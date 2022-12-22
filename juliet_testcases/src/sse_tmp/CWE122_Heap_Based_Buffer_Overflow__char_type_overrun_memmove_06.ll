; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !28, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !33
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !34
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !32
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !35
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !41
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !42
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !43
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !45
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !45
  call void @printLine(i8* %4), !dbg !46
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !47
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !48
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !49
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !49
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !51
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !54
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay4), !dbg !55
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !57
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !57
  call void @printLine(i8* %9), !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06_good() #0 !dbg !60 {
entry:
  call void @good1(), !dbg !61
  call void @good2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !83 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !84, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !89
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !90
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !88
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !91
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !97
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !98
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !99
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !100
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !101
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !101
  call void @printLine(i8* %4), !dbg !102
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !104
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !105
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !107
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !110
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay4), !dbg !111
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !113
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !113
  call void @printLine(i8* %9), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !116 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !117, metadata !DIExpression()), !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !122
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !123
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !121
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !131
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !132
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !134
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !134
  call void @printLine(i8* %4), !dbg !135
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !136
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !137
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !138
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !139
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !140
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !139
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !142
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !143
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !142
  call void @printLine(i8* %arraydecay4), !dbg !144
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !145
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !146
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !146
  call void @printLine(i8* %9), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06_bad", scope: !6, file: !6, line: 38, type: !26, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !6, line: 43, type: !4)
!29 = distinct !DILexicalBlock(scope: !30, file: !6, line: 42, column: 9)
!30 = distinct !DILexicalBlock(scope: !31, file: !6, line: 41, column: 5)
!31 = distinct !DILexicalBlock(scope: !25, file: !6, line: 40, column: 8)
!32 = !DILocation(line: 43, column: 24, scope: !29)
!33 = !DILocation(line: 43, column: 53, scope: !29)
!34 = !DILocation(line: 43, column: 41, scope: !29)
!35 = !DILocation(line: 44, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !6, line: 44, column: 17)
!37 = !DILocation(line: 44, column: 32, scope: !36)
!38 = !DILocation(line: 44, column: 17, scope: !29)
!39 = !DILocation(line: 44, column: 42, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !6, line: 44, column: 41)
!41 = !DILocation(line: 45, column: 13, scope: !29)
!42 = !DILocation(line: 45, column: 29, scope: !29)
!43 = !DILocation(line: 45, column: 40, scope: !29)
!44 = !DILocation(line: 47, column: 31, scope: !29)
!45 = !DILocation(line: 47, column: 47, scope: !29)
!46 = !DILocation(line: 47, column: 13, scope: !29)
!47 = !DILocation(line: 49, column: 21, scope: !29)
!48 = !DILocation(line: 49, column: 37, scope: !29)
!49 = !DILocation(line: 49, column: 13, scope: !29)
!50 = !DILocation(line: 50, column: 13, scope: !29)
!51 = !DILocation(line: 50, column: 29, scope: !29)
!52 = !DILocation(line: 50, column: 91, scope: !29)
!53 = !DILocation(line: 51, column: 31, scope: !29)
!54 = !DILocation(line: 51, column: 47, scope: !29)
!55 = !DILocation(line: 51, column: 13, scope: !29)
!56 = !DILocation(line: 52, column: 31, scope: !29)
!57 = !DILocation(line: 52, column: 47, scope: !29)
!58 = !DILocation(line: 52, column: 13, scope: !29)
!59 = !DILocation(line: 55, column: 1, scope: !25)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_06_good", scope: !6, file: !6, line: 106, type: !26, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 108, column: 5, scope: !60)
!62 = !DILocation(line: 109, column: 5, scope: !60)
!63 = !DILocation(line: 110, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 121, type: !65, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !6, line: 121, type: !67)
!70 = !DILocation(line: 121, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !6, line: 121, type: !68)
!72 = !DILocation(line: 121, column: 27, scope: !64)
!73 = !DILocation(line: 124, column: 22, scope: !64)
!74 = !DILocation(line: 124, column: 12, scope: !64)
!75 = !DILocation(line: 124, column: 5, scope: !64)
!76 = !DILocation(line: 126, column: 5, scope: !64)
!77 = !DILocation(line: 127, column: 5, scope: !64)
!78 = !DILocation(line: 128, column: 5, scope: !64)
!79 = !DILocation(line: 131, column: 5, scope: !64)
!80 = !DILocation(line: 132, column: 5, scope: !64)
!81 = !DILocation(line: 133, column: 5, scope: !64)
!82 = !DILocation(line: 135, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 62, type: !26, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "structCharVoid", scope: !85, file: !6, line: 72, type: !4)
!85 = distinct !DILexicalBlock(scope: !86, file: !6, line: 71, column: 9)
!86 = distinct !DILexicalBlock(scope: !87, file: !6, line: 70, column: 5)
!87 = distinct !DILexicalBlock(scope: !83, file: !6, line: 64, column: 8)
!88 = !DILocation(line: 72, column: 24, scope: !85)
!89 = !DILocation(line: 72, column: 53, scope: !85)
!90 = !DILocation(line: 72, column: 41, scope: !85)
!91 = !DILocation(line: 73, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !6, line: 73, column: 17)
!93 = !DILocation(line: 73, column: 32, scope: !92)
!94 = !DILocation(line: 73, column: 17, scope: !85)
!95 = !DILocation(line: 73, column: 42, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !6, line: 73, column: 41)
!97 = !DILocation(line: 74, column: 13, scope: !85)
!98 = !DILocation(line: 74, column: 29, scope: !85)
!99 = !DILocation(line: 74, column: 40, scope: !85)
!100 = !DILocation(line: 76, column: 31, scope: !85)
!101 = !DILocation(line: 76, column: 47, scope: !85)
!102 = !DILocation(line: 76, column: 13, scope: !85)
!103 = !DILocation(line: 78, column: 21, scope: !85)
!104 = !DILocation(line: 78, column: 37, scope: !85)
!105 = !DILocation(line: 78, column: 13, scope: !85)
!106 = !DILocation(line: 79, column: 13, scope: !85)
!107 = !DILocation(line: 79, column: 29, scope: !85)
!108 = !DILocation(line: 79, column: 91, scope: !85)
!109 = !DILocation(line: 80, column: 31, scope: !85)
!110 = !DILocation(line: 80, column: 47, scope: !85)
!111 = !DILocation(line: 80, column: 13, scope: !85)
!112 = !DILocation(line: 81, column: 31, scope: !85)
!113 = !DILocation(line: 81, column: 47, scope: !85)
!114 = !DILocation(line: 81, column: 13, scope: !85)
!115 = !DILocation(line: 84, column: 1, scope: !83)
!116 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 87, type: !26, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "structCharVoid", scope: !118, file: !6, line: 92, type: !4)
!118 = distinct !DILexicalBlock(scope: !119, file: !6, line: 91, column: 9)
!119 = distinct !DILexicalBlock(scope: !120, file: !6, line: 90, column: 5)
!120 = distinct !DILexicalBlock(scope: !116, file: !6, line: 89, column: 8)
!121 = !DILocation(line: 92, column: 24, scope: !118)
!122 = !DILocation(line: 92, column: 53, scope: !118)
!123 = !DILocation(line: 92, column: 41, scope: !118)
!124 = !DILocation(line: 93, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !6, line: 93, column: 17)
!126 = !DILocation(line: 93, column: 32, scope: !125)
!127 = !DILocation(line: 93, column: 17, scope: !118)
!128 = !DILocation(line: 93, column: 42, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !6, line: 93, column: 41)
!130 = !DILocation(line: 94, column: 13, scope: !118)
!131 = !DILocation(line: 94, column: 29, scope: !118)
!132 = !DILocation(line: 94, column: 40, scope: !118)
!133 = !DILocation(line: 96, column: 31, scope: !118)
!134 = !DILocation(line: 96, column: 47, scope: !118)
!135 = !DILocation(line: 96, column: 13, scope: !118)
!136 = !DILocation(line: 98, column: 21, scope: !118)
!137 = !DILocation(line: 98, column: 37, scope: !118)
!138 = !DILocation(line: 98, column: 13, scope: !118)
!139 = !DILocation(line: 99, column: 13, scope: !118)
!140 = !DILocation(line: 99, column: 29, scope: !118)
!141 = !DILocation(line: 99, column: 91, scope: !118)
!142 = !DILocation(line: 100, column: 31, scope: !118)
!143 = !DILocation(line: 100, column: 47, scope: !118)
!144 = !DILocation(line: 100, column: 13, scope: !118)
!145 = !DILocation(line: 101, column: 31, scope: !118)
!146 = !DILocation(line: 101, column: 47, scope: !118)
!147 = !DILocation(line: 101, column: 13, scope: !118)
!148 = !DILocation(line: 104, column: 1, scope: !116)
