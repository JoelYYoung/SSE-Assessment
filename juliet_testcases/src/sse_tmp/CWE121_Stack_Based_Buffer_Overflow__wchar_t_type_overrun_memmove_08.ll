; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_bad() #0 !dbg !16 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !23, metadata !DIExpression()), !dbg !35
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !36
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !37
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !38
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !38
  %1 = bitcast i8* %0 to i32*, !dbg !39
  call void @printWLine(i32* %1), !dbg !40
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !41
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !42
  %2 = bitcast i32* %arraydecay to i8*, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !42
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !43
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !46
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !47
  call void @printWLine(i32* %arraydecay4), !dbg !48
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !49
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !49
  %4 = bitcast i8* %3 to i32*, !dbg !50
  call void @printWLine(i32* %4), !dbg !51
  br label %if.end, !dbg !52

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_good() #0 !dbg !54 {
entry:
  call void @good1(), !dbg !55
  call void @good2(), !dbg !56
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !78 {
entry:
  ret i32 1, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !82 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %call = call i32 @staticReturnsFalse(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !89, metadata !DIExpression()), !dbg !92
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !93
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !94
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !95
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  call void @printWLine(i32* %1), !dbg !97
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !98
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !99
  %2 = bitcast i32* %arraydecay to i8*, !dbg !99
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !99
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !100
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !103
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !104
  call void @printWLine(i32* %arraydecay4), !dbg !105
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !106
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !106
  %4 = bitcast i8* %3 to i32*, !dbg !107
  call void @printWLine(i32* %4), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !110 {
entry:
  ret i32 0, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !112 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !116, metadata !DIExpression()), !dbg !119
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !120
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !121
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !122
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !122
  %1 = bitcast i8* %0 to i32*, !dbg !123
  call void @printWLine(i32* %1), !dbg !124
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !125
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !126
  %2 = bitcast i32* %arraydecay to i8*, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !126
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !127
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !130
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !131
  call void @printWLine(i32* %arraydecay4), !dbg !132
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !133
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !133
  %4 = bitcast i8* %3 to i32*, !dbg !134
  call void @printWLine(i32* %4), !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_bad", scope: !17, file: !17, line: 47, type: !18, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 49, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 8)
!22 = !DILocation(line: 49, column: 8, scope: !16)
!23 = !DILocalVariable(name: "structCharVoid", scope: !24, file: !17, line: 52, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 51, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !17, line: 50, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !28)
!28 = !{!29, !33, !34}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !27, file: !17, line: 27, baseType: !30, size: 512)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 16)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !27, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !27, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!35 = !DILocation(line: 52, column: 22, scope: !24)
!36 = !DILocation(line: 53, column: 28, scope: !24)
!37 = !DILocation(line: 53, column: 39, scope: !24)
!38 = !DILocation(line: 55, column: 50, scope: !24)
!39 = !DILocation(line: 55, column: 24, scope: !24)
!40 = !DILocation(line: 55, column: 13, scope: !24)
!41 = !DILocation(line: 57, column: 36, scope: !24)
!42 = !DILocation(line: 57, column: 13, scope: !24)
!43 = !DILocation(line: 58, column: 28, scope: !24)
!44 = !DILocation(line: 58, column: 13, scope: !24)
!45 = !DILocation(line: 58, column: 92, scope: !24)
!46 = !DILocation(line: 59, column: 50, scope: !24)
!47 = !DILocation(line: 59, column: 35, scope: !24)
!48 = !DILocation(line: 59, column: 13, scope: !24)
!49 = !DILocation(line: 60, column: 50, scope: !24)
!50 = !DILocation(line: 60, column: 24, scope: !24)
!51 = !DILocation(line: 60, column: 13, scope: !24)
!52 = !DILocation(line: 62, column: 5, scope: !25)
!53 = !DILocation(line: 63, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_good", scope: !17, file: !17, line: 112, type: !18, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 114, column: 5, scope: !54)
!56 = !DILocation(line: 115, column: 5, scope: !54)
!57 = !DILocation(line: 116, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 127, type: !59, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 127, type: !8)
!65 = !DILocation(line: 127, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 127, type: !61)
!67 = !DILocation(line: 127, column: 27, scope: !58)
!68 = !DILocation(line: 130, column: 22, scope: !58)
!69 = !DILocation(line: 130, column: 12, scope: !58)
!70 = !DILocation(line: 130, column: 5, scope: !58)
!71 = !DILocation(line: 132, column: 5, scope: !58)
!72 = !DILocation(line: 133, column: 5, scope: !58)
!73 = !DILocation(line: 134, column: 5, scope: !58)
!74 = !DILocation(line: 137, column: 5, scope: !58)
!75 = !DILocation(line: 138, column: 5, scope: !58)
!76 = !DILocation(line: 139, column: 5, scope: !58)
!77 = !DILocation(line: 141, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 35, type: !79, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!8}
!81 = !DILocation(line: 37, column: 5, scope: !78)
!82 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 70, type: !18, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 72, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !82, file: !17, line: 72, column: 8)
!85 = !DILocation(line: 72, column: 8, scope: !82)
!86 = !DILocation(line: 75, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !17, line: 73, column: 5)
!88 = !DILocation(line: 76, column: 5, scope: !87)
!89 = !DILocalVariable(name: "structCharVoid", scope: !90, file: !17, line: 80, type: !26)
!90 = distinct !DILexicalBlock(scope: !91, file: !17, line: 79, column: 9)
!91 = distinct !DILexicalBlock(scope: !84, file: !17, line: 78, column: 5)
!92 = !DILocation(line: 80, column: 22, scope: !90)
!93 = !DILocation(line: 81, column: 28, scope: !90)
!94 = !DILocation(line: 81, column: 39, scope: !90)
!95 = !DILocation(line: 83, column: 50, scope: !90)
!96 = !DILocation(line: 83, column: 24, scope: !90)
!97 = !DILocation(line: 83, column: 13, scope: !90)
!98 = !DILocation(line: 85, column: 36, scope: !90)
!99 = !DILocation(line: 85, column: 13, scope: !90)
!100 = !DILocation(line: 86, column: 28, scope: !90)
!101 = !DILocation(line: 86, column: 13, scope: !90)
!102 = !DILocation(line: 86, column: 92, scope: !90)
!103 = !DILocation(line: 87, column: 50, scope: !90)
!104 = !DILocation(line: 87, column: 35, scope: !90)
!105 = !DILocation(line: 87, column: 13, scope: !90)
!106 = !DILocation(line: 88, column: 50, scope: !90)
!107 = !DILocation(line: 88, column: 24, scope: !90)
!108 = !DILocation(line: 88, column: 13, scope: !90)
!109 = !DILocation(line: 91, column: 1, scope: !82)
!110 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 40, type: !79, scopeLine: 41, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 42, column: 5, scope: !110)
!112 = distinct !DISubprogram(name: "good2", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocation(line: 96, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !112, file: !17, line: 96, column: 8)
!115 = !DILocation(line: 96, column: 8, scope: !112)
!116 = !DILocalVariable(name: "structCharVoid", scope: !117, file: !17, line: 99, type: !26)
!117 = distinct !DILexicalBlock(scope: !118, file: !17, line: 98, column: 9)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 97, column: 5)
!119 = !DILocation(line: 99, column: 22, scope: !117)
!120 = !DILocation(line: 100, column: 28, scope: !117)
!121 = !DILocation(line: 100, column: 39, scope: !117)
!122 = !DILocation(line: 102, column: 50, scope: !117)
!123 = !DILocation(line: 102, column: 24, scope: !117)
!124 = !DILocation(line: 102, column: 13, scope: !117)
!125 = !DILocation(line: 104, column: 36, scope: !117)
!126 = !DILocation(line: 104, column: 13, scope: !117)
!127 = !DILocation(line: 105, column: 28, scope: !117)
!128 = !DILocation(line: 105, column: 13, scope: !117)
!129 = !DILocation(line: 105, column: 92, scope: !117)
!130 = !DILocation(line: 106, column: 50, scope: !117)
!131 = !DILocation(line: 106, column: 35, scope: !117)
!132 = !DILocation(line: 106, column: 13, scope: !117)
!133 = !DILocation(line: 107, column: 50, scope: !117)
!134 = !DILocation(line: 107, column: 24, scope: !117)
!135 = !DILocation(line: 107, column: 13, scope: !117)
!136 = !DILocation(line: 109, column: 5, scope: !118)
!137 = !DILocation(line: 110, column: 1, scope: !112)
