; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end8, !dbg !31

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !32, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !36
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !37
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !35
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !38
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !40
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !41

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !45
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !46
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !47
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !48
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !48
  call void @printLine(i8* %5), !dbg !49
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !51
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !52
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !54
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !57
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay6), !dbg !58
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !60
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !60
  call void @printLine(i8* %10), !dbg !61
  br label %if.end8, !dbg !62

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !63
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13_good() #0 !dbg !64 {
entry:
  call void @good1(), !dbg !65
  call void @good2(), !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !87 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !92
  br label %if.end8, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !95, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !99
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !100
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !98
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !101
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !103
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !104

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !108
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !109
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !111
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !111
  call void @printLine(i8* %5), !dbg !112
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !114
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !115
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !116
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !117
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !120
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !119
  call void @printLine(i8* %arraydecay6), !dbg !121
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !123
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !123
  call void @printLine(i8* %10), !dbg !124
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !126 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !127
  %cmp = icmp eq i32 %0, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.end8, !dbg !130

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !131, metadata !DIExpression()), !dbg !134
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !135
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !136
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !134
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !139
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !140

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !144
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !145
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !147
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !147
  call void @printLine(i8* %5), !dbg !148
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !150
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !151
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !151
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !153
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !156
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !155
  call void @printLine(i8* %arraydecay6), !dbg !157
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !158
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !159
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !159
  call void @printLine(i8* %10), !dbg !160
  br label %if.end8, !dbg !161

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !162
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocation(line: 35, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 35, column: 8)
!30 = !DILocation(line: 35, column: 25, scope: !29)
!31 = !DILocation(line: 35, column: 8, scope: !25)
!32 = !DILocalVariable(name: "structCharVoid", scope: !33, file: !6, line: 38, type: !4)
!33 = distinct !DILexicalBlock(scope: !34, file: !6, line: 37, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !6, line: 36, column: 5)
!35 = !DILocation(line: 38, column: 24, scope: !33)
!36 = !DILocation(line: 38, column: 53, scope: !33)
!37 = !DILocation(line: 38, column: 41, scope: !33)
!38 = !DILocation(line: 39, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !6, line: 39, column: 17)
!40 = !DILocation(line: 39, column: 32, scope: !39)
!41 = !DILocation(line: 39, column: 17, scope: !33)
!42 = !DILocation(line: 39, column: 42, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !6, line: 39, column: 41)
!44 = !DILocation(line: 40, column: 13, scope: !33)
!45 = !DILocation(line: 40, column: 29, scope: !33)
!46 = !DILocation(line: 40, column: 40, scope: !33)
!47 = !DILocation(line: 42, column: 31, scope: !33)
!48 = !DILocation(line: 42, column: 47, scope: !33)
!49 = !DILocation(line: 42, column: 13, scope: !33)
!50 = !DILocation(line: 44, column: 21, scope: !33)
!51 = !DILocation(line: 44, column: 37, scope: !33)
!52 = !DILocation(line: 44, column: 13, scope: !33)
!53 = !DILocation(line: 45, column: 13, scope: !33)
!54 = !DILocation(line: 45, column: 29, scope: !33)
!55 = !DILocation(line: 45, column: 91, scope: !33)
!56 = !DILocation(line: 46, column: 31, scope: !33)
!57 = !DILocation(line: 46, column: 47, scope: !33)
!58 = !DILocation(line: 46, column: 13, scope: !33)
!59 = !DILocation(line: 47, column: 31, scope: !33)
!60 = !DILocation(line: 47, column: 47, scope: !33)
!61 = !DILocation(line: 47, column: 13, scope: !33)
!62 = !DILocation(line: 49, column: 5, scope: !34)
!63 = !DILocation(line: 50, column: 1, scope: !25)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_13_good", scope: !6, file: !6, line: 101, type: !26, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 103, column: 5, scope: !64)
!66 = !DILocation(line: 104, column: 5, scope: !64)
!67 = !DILocation(line: 105, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 116, type: !69, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !6, line: 116, type: !71)
!74 = !DILocation(line: 116, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !6, line: 116, type: !72)
!76 = !DILocation(line: 116, column: 27, scope: !68)
!77 = !DILocation(line: 119, column: 22, scope: !68)
!78 = !DILocation(line: 119, column: 12, scope: !68)
!79 = !DILocation(line: 119, column: 5, scope: !68)
!80 = !DILocation(line: 121, column: 5, scope: !68)
!81 = !DILocation(line: 122, column: 5, scope: !68)
!82 = !DILocation(line: 123, column: 5, scope: !68)
!83 = !DILocation(line: 126, column: 5, scope: !68)
!84 = !DILocation(line: 127, column: 5, scope: !68)
!85 = !DILocation(line: 128, column: 5, scope: !68)
!86 = !DILocation(line: 130, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 57, type: !26, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 59, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !6, line: 59, column: 8)
!90 = !DILocation(line: 59, column: 25, scope: !89)
!91 = !DILocation(line: 59, column: 8, scope: !87)
!92 = !DILocation(line: 62, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !6, line: 60, column: 5)
!94 = !DILocation(line: 63, column: 5, scope: !93)
!95 = !DILocalVariable(name: "structCharVoid", scope: !96, file: !6, line: 67, type: !4)
!96 = distinct !DILexicalBlock(scope: !97, file: !6, line: 66, column: 9)
!97 = distinct !DILexicalBlock(scope: !89, file: !6, line: 65, column: 5)
!98 = !DILocation(line: 67, column: 24, scope: !96)
!99 = !DILocation(line: 67, column: 53, scope: !96)
!100 = !DILocation(line: 67, column: 41, scope: !96)
!101 = !DILocation(line: 68, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !6, line: 68, column: 17)
!103 = !DILocation(line: 68, column: 32, scope: !102)
!104 = !DILocation(line: 68, column: 17, scope: !96)
!105 = !DILocation(line: 68, column: 42, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !6, line: 68, column: 41)
!107 = !DILocation(line: 69, column: 13, scope: !96)
!108 = !DILocation(line: 69, column: 29, scope: !96)
!109 = !DILocation(line: 69, column: 40, scope: !96)
!110 = !DILocation(line: 71, column: 31, scope: !96)
!111 = !DILocation(line: 71, column: 47, scope: !96)
!112 = !DILocation(line: 71, column: 13, scope: !96)
!113 = !DILocation(line: 73, column: 21, scope: !96)
!114 = !DILocation(line: 73, column: 37, scope: !96)
!115 = !DILocation(line: 73, column: 13, scope: !96)
!116 = !DILocation(line: 74, column: 13, scope: !96)
!117 = !DILocation(line: 74, column: 29, scope: !96)
!118 = !DILocation(line: 74, column: 91, scope: !96)
!119 = !DILocation(line: 75, column: 31, scope: !96)
!120 = !DILocation(line: 75, column: 47, scope: !96)
!121 = !DILocation(line: 75, column: 13, scope: !96)
!122 = !DILocation(line: 76, column: 31, scope: !96)
!123 = !DILocation(line: 76, column: 47, scope: !96)
!124 = !DILocation(line: 76, column: 13, scope: !96)
!125 = !DILocation(line: 79, column: 1, scope: !87)
!126 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 82, type: !26, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocation(line: 84, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !126, file: !6, line: 84, column: 8)
!129 = !DILocation(line: 84, column: 25, scope: !128)
!130 = !DILocation(line: 84, column: 8, scope: !126)
!131 = !DILocalVariable(name: "structCharVoid", scope: !132, file: !6, line: 87, type: !4)
!132 = distinct !DILexicalBlock(scope: !133, file: !6, line: 86, column: 9)
!133 = distinct !DILexicalBlock(scope: !128, file: !6, line: 85, column: 5)
!134 = !DILocation(line: 87, column: 24, scope: !132)
!135 = !DILocation(line: 87, column: 53, scope: !132)
!136 = !DILocation(line: 87, column: 41, scope: !132)
!137 = !DILocation(line: 88, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !6, line: 88, column: 17)
!139 = !DILocation(line: 88, column: 32, scope: !138)
!140 = !DILocation(line: 88, column: 17, scope: !132)
!141 = !DILocation(line: 88, column: 42, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !6, line: 88, column: 41)
!143 = !DILocation(line: 89, column: 13, scope: !132)
!144 = !DILocation(line: 89, column: 29, scope: !132)
!145 = !DILocation(line: 89, column: 40, scope: !132)
!146 = !DILocation(line: 91, column: 31, scope: !132)
!147 = !DILocation(line: 91, column: 47, scope: !132)
!148 = !DILocation(line: 91, column: 13, scope: !132)
!149 = !DILocation(line: 93, column: 21, scope: !132)
!150 = !DILocation(line: 93, column: 37, scope: !132)
!151 = !DILocation(line: 93, column: 13, scope: !132)
!152 = !DILocation(line: 94, column: 13, scope: !132)
!153 = !DILocation(line: 94, column: 29, scope: !132)
!154 = !DILocation(line: 94, column: 91, scope: !132)
!155 = !DILocation(line: 95, column: 31, scope: !132)
!156 = !DILocation(line: 95, column: 47, scope: !132)
!157 = !DILocation(line: 95, column: 13, scope: !132)
!158 = !DILocation(line: 96, column: 31, scope: !132)
!159 = !DILocation(line: 96, column: 47, scope: !132)
!160 = !DILocation(line: 96, column: 13, scope: !132)
!161 = !DILocation(line: 98, column: 5, scope: !133)
!162 = !DILocation(line: 99, column: 1, scope: !126)
