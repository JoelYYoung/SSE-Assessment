; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07_bad() #0 !dbg !29 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %0, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end8, !dbg !35

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !36, metadata !DIExpression()), !dbg !39
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !40
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !41
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !42
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !44
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !45

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !49
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !50
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !52
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !52
  call void @printLine(i8* %5), !dbg !53
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !55
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !56
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !56
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !58
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !59
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !60
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !61
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay6), !dbg !62
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !63
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !64
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !64
  call void @printLine(i8* %10), !dbg !65
  br label %if.end8, !dbg !66

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !67
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07_good() #0 !dbg !68 {
entry:
  call void @good1(), !dbg !69
  call void @good2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !90 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp ne i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end8, !dbg !97

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !98, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !102
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !103
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !101
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !104
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !106
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !107

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !111
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !112
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !114
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !114
  call void @printLine(i8* %5), !dbg !115
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !116
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !117
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !118
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !120
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !123
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay6), !dbg !124
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !126
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !126
  call void @printLine(i8* %10), !dbg !127
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !129 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !130
  %cmp = icmp eq i32 %0, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.end8, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !134, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !138
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !139
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !142
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !143

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !147
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !148
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !150
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !150
  call void @printLine(i8* %5), !dbg !151
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !153
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !154
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !156
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !158
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !159
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !158
  call void @printLine(i8* %arraydecay6), !dbg !160
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !161
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !162
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !162
  call void @printLine(i8* %10), !dbg !163
  br label %if.end8, !dbg !164

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 34, type: !22, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !21, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !17, !19, !20}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !8, line: 24, size: 256, elements: !10)
!10 = !{!11, !16, !18}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !9, file: !8, line: 26, baseType: !12, size: 128)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 16)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !9, file: !8, line: 27, baseType: !17, size: 64, offset: 128)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !9, file: !8, line: 28, baseType: !17, size: 64, offset: 192)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !{!0}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{i32 7, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"clang version 13.0.0"}
!29 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07_bad", scope: !8, file: !8, line: 38, type: !30, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocation(line: 40, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !8, line: 40, column: 8)
!34 = !DILocation(line: 40, column: 18, scope: !33)
!35 = !DILocation(line: 40, column: 8, scope: !29)
!36 = !DILocalVariable(name: "structCharVoid", scope: !37, file: !8, line: 43, type: !6)
!37 = distinct !DILexicalBlock(scope: !38, file: !8, line: 42, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !8, line: 41, column: 5)
!39 = !DILocation(line: 43, column: 24, scope: !37)
!40 = !DILocation(line: 43, column: 53, scope: !37)
!41 = !DILocation(line: 43, column: 41, scope: !37)
!42 = !DILocation(line: 44, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !8, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 32, scope: !43)
!45 = !DILocation(line: 44, column: 17, scope: !37)
!46 = !DILocation(line: 44, column: 42, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !8, line: 44, column: 41)
!48 = !DILocation(line: 45, column: 13, scope: !37)
!49 = !DILocation(line: 45, column: 29, scope: !37)
!50 = !DILocation(line: 45, column: 40, scope: !37)
!51 = !DILocation(line: 47, column: 31, scope: !37)
!52 = !DILocation(line: 47, column: 47, scope: !37)
!53 = !DILocation(line: 47, column: 13, scope: !37)
!54 = !DILocation(line: 49, column: 21, scope: !37)
!55 = !DILocation(line: 49, column: 37, scope: !37)
!56 = !DILocation(line: 49, column: 13, scope: !37)
!57 = !DILocation(line: 50, column: 13, scope: !37)
!58 = !DILocation(line: 50, column: 29, scope: !37)
!59 = !DILocation(line: 50, column: 91, scope: !37)
!60 = !DILocation(line: 51, column: 31, scope: !37)
!61 = !DILocation(line: 51, column: 47, scope: !37)
!62 = !DILocation(line: 51, column: 13, scope: !37)
!63 = !DILocation(line: 52, column: 31, scope: !37)
!64 = !DILocation(line: 52, column: 47, scope: !37)
!65 = !DILocation(line: 52, column: 13, scope: !37)
!66 = !DILocation(line: 54, column: 5, scope: !38)
!67 = !DILocation(line: 55, column: 1, scope: !29)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_07_good", scope: !8, file: !8, line: 106, type: !30, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 108, column: 5, scope: !68)
!70 = !DILocation(line: 109, column: 5, scope: !68)
!71 = !DILocation(line: 110, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 121, type: !73, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!22, !22, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !8, line: 121, type: !22)
!77 = !DILocation(line: 121, column: 14, scope: !72)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !8, line: 121, type: !75)
!79 = !DILocation(line: 121, column: 27, scope: !72)
!80 = !DILocation(line: 124, column: 22, scope: !72)
!81 = !DILocation(line: 124, column: 12, scope: !72)
!82 = !DILocation(line: 124, column: 5, scope: !72)
!83 = !DILocation(line: 126, column: 5, scope: !72)
!84 = !DILocation(line: 127, column: 5, scope: !72)
!85 = !DILocation(line: 128, column: 5, scope: !72)
!86 = !DILocation(line: 131, column: 5, scope: !72)
!87 = !DILocation(line: 132, column: 5, scope: !72)
!88 = !DILocation(line: 133, column: 5, scope: !72)
!89 = !DILocation(line: 135, column: 5, scope: !72)
!90 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 62, type: !30, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 64, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !8, line: 64, column: 8)
!93 = !DILocation(line: 64, column: 18, scope: !92)
!94 = !DILocation(line: 64, column: 8, scope: !90)
!95 = !DILocation(line: 67, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !8, line: 65, column: 5)
!97 = !DILocation(line: 68, column: 5, scope: !96)
!98 = !DILocalVariable(name: "structCharVoid", scope: !99, file: !8, line: 72, type: !6)
!99 = distinct !DILexicalBlock(scope: !100, file: !8, line: 71, column: 9)
!100 = distinct !DILexicalBlock(scope: !92, file: !8, line: 70, column: 5)
!101 = !DILocation(line: 72, column: 24, scope: !99)
!102 = !DILocation(line: 72, column: 53, scope: !99)
!103 = !DILocation(line: 72, column: 41, scope: !99)
!104 = !DILocation(line: 73, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !8, line: 73, column: 17)
!106 = !DILocation(line: 73, column: 32, scope: !105)
!107 = !DILocation(line: 73, column: 17, scope: !99)
!108 = !DILocation(line: 73, column: 42, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !8, line: 73, column: 41)
!110 = !DILocation(line: 74, column: 13, scope: !99)
!111 = !DILocation(line: 74, column: 29, scope: !99)
!112 = !DILocation(line: 74, column: 40, scope: !99)
!113 = !DILocation(line: 76, column: 31, scope: !99)
!114 = !DILocation(line: 76, column: 47, scope: !99)
!115 = !DILocation(line: 76, column: 13, scope: !99)
!116 = !DILocation(line: 78, column: 21, scope: !99)
!117 = !DILocation(line: 78, column: 37, scope: !99)
!118 = !DILocation(line: 78, column: 13, scope: !99)
!119 = !DILocation(line: 79, column: 13, scope: !99)
!120 = !DILocation(line: 79, column: 29, scope: !99)
!121 = !DILocation(line: 79, column: 91, scope: !99)
!122 = !DILocation(line: 80, column: 31, scope: !99)
!123 = !DILocation(line: 80, column: 47, scope: !99)
!124 = !DILocation(line: 80, column: 13, scope: !99)
!125 = !DILocation(line: 81, column: 31, scope: !99)
!126 = !DILocation(line: 81, column: 47, scope: !99)
!127 = !DILocation(line: 81, column: 13, scope: !99)
!128 = !DILocation(line: 84, column: 1, scope: !90)
!129 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 87, type: !30, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocation(line: 89, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !129, file: !8, line: 89, column: 8)
!132 = !DILocation(line: 89, column: 18, scope: !131)
!133 = !DILocation(line: 89, column: 8, scope: !129)
!134 = !DILocalVariable(name: "structCharVoid", scope: !135, file: !8, line: 92, type: !6)
!135 = distinct !DILexicalBlock(scope: !136, file: !8, line: 91, column: 9)
!136 = distinct !DILexicalBlock(scope: !131, file: !8, line: 90, column: 5)
!137 = !DILocation(line: 92, column: 24, scope: !135)
!138 = !DILocation(line: 92, column: 53, scope: !135)
!139 = !DILocation(line: 92, column: 41, scope: !135)
!140 = !DILocation(line: 93, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !8, line: 93, column: 17)
!142 = !DILocation(line: 93, column: 32, scope: !141)
!143 = !DILocation(line: 93, column: 17, scope: !135)
!144 = !DILocation(line: 93, column: 42, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !8, line: 93, column: 41)
!146 = !DILocation(line: 94, column: 13, scope: !135)
!147 = !DILocation(line: 94, column: 29, scope: !135)
!148 = !DILocation(line: 94, column: 40, scope: !135)
!149 = !DILocation(line: 96, column: 31, scope: !135)
!150 = !DILocation(line: 96, column: 47, scope: !135)
!151 = !DILocation(line: 96, column: 13, scope: !135)
!152 = !DILocation(line: 98, column: 21, scope: !135)
!153 = !DILocation(line: 98, column: 37, scope: !135)
!154 = !DILocation(line: 98, column: 13, scope: !135)
!155 = !DILocation(line: 99, column: 13, scope: !135)
!156 = !DILocation(line: 99, column: 29, scope: !135)
!157 = !DILocation(line: 99, column: 91, scope: !135)
!158 = !DILocation(line: 100, column: 31, scope: !135)
!159 = !DILocation(line: 100, column: 47, scope: !135)
!160 = !DILocation(line: 100, column: 13, scope: !135)
!161 = !DILocation(line: 101, column: 31, scope: !135)
!162 = !DILocation(line: 101, column: 47, scope: !135)
!163 = !DILocation(line: 101, column: 13, scope: !135)
!164 = !DILocation(line: 103, column: 5, scope: !136)
!165 = !DILocation(line: 104, column: 1, scope: !129)
