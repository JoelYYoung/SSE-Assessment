; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end7, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !31, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !35
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !36
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !34
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !37
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !39
  br i1 %cmp, label %if.then1, label %if.end, !dbg !40

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !44
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !45
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !46
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !47
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !47
  call void @printLine(i8* %5), !dbg !48
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !50
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !51
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !53
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !56
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay5), !dbg !57
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !59
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !59
  call void @printLine(i8* %10), !dbg !60
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !61
  call void @free(i8* %12) #6, !dbg !62
  br label %if.end7, !dbg !63

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10_good() #0 !dbg !65 {
entry:
  call void @good1(), !dbg !66
  call void @good2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !88 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !92
  br label %if.end7, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !95, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !99
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !100
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !98
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !101
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !103
  br i1 %cmp, label %if.then1, label %if.end, !dbg !104

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !108
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !109
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !111
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !111
  call void @printLine(i8* %5), !dbg !112
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !114
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !115
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !116
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !117
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !120
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !119
  call void @printLine(i8* %arraydecay5), !dbg !121
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !123
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !123
  call void @printLine(i8* %10), !dbg !124
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !125
  call void @free(i8* %12) #6, !dbg !126
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !128 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end7, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !132, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !136
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !137
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !135
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !138
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !140
  br i1 %cmp, label %if.then1, label %if.end, !dbg !141

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !145
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !146
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !148
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !148
  call void @printLine(i8* %5), !dbg !149
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !151
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !152
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !152
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !154
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !156
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !157
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !156
  call void @printLine(i8* %arraydecay5), !dbg !158
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !159
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !160
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !160
  call void @printLine(i8* %10), !dbg !161
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !162
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !162
  call void @free(i8* %12) #6, !dbg !163
  br label %if.end7, !dbg !164

if.end7:                                          ; preds = %if.end, %entry
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocation(line: 35, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 35, column: 8)
!30 = !DILocation(line: 35, column: 8, scope: !25)
!31 = !DILocalVariable(name: "structCharVoid", scope: !32, file: !6, line: 38, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !6, line: 37, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !6, line: 36, column: 5)
!34 = !DILocation(line: 38, column: 24, scope: !32)
!35 = !DILocation(line: 38, column: 53, scope: !32)
!36 = !DILocation(line: 38, column: 41, scope: !32)
!37 = !DILocation(line: 39, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !6, line: 39, column: 17)
!39 = !DILocation(line: 39, column: 32, scope: !38)
!40 = !DILocation(line: 39, column: 17, scope: !32)
!41 = !DILocation(line: 39, column: 42, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !6, line: 39, column: 41)
!43 = !DILocation(line: 40, column: 13, scope: !32)
!44 = !DILocation(line: 40, column: 29, scope: !32)
!45 = !DILocation(line: 40, column: 40, scope: !32)
!46 = !DILocation(line: 42, column: 31, scope: !32)
!47 = !DILocation(line: 42, column: 47, scope: !32)
!48 = !DILocation(line: 42, column: 13, scope: !32)
!49 = !DILocation(line: 44, column: 20, scope: !32)
!50 = !DILocation(line: 44, column: 36, scope: !32)
!51 = !DILocation(line: 44, column: 13, scope: !32)
!52 = !DILocation(line: 45, column: 13, scope: !32)
!53 = !DILocation(line: 45, column: 29, scope: !32)
!54 = !DILocation(line: 45, column: 91, scope: !32)
!55 = !DILocation(line: 46, column: 31, scope: !32)
!56 = !DILocation(line: 46, column: 47, scope: !32)
!57 = !DILocation(line: 46, column: 13, scope: !32)
!58 = !DILocation(line: 47, column: 31, scope: !32)
!59 = !DILocation(line: 47, column: 47, scope: !32)
!60 = !DILocation(line: 47, column: 13, scope: !32)
!61 = !DILocation(line: 48, column: 18, scope: !32)
!62 = !DILocation(line: 48, column: 13, scope: !32)
!63 = !DILocation(line: 50, column: 5, scope: !33)
!64 = !DILocation(line: 51, column: 1, scope: !25)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_10_good", scope: !6, file: !6, line: 104, type: !26, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 106, column: 5, scope: !65)
!67 = !DILocation(line: 107, column: 5, scope: !65)
!68 = !DILocation(line: 108, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 119, type: !70, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !73}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !6, line: 119, type: !72)
!75 = !DILocation(line: 119, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !6, line: 119, type: !73)
!77 = !DILocation(line: 119, column: 27, scope: !69)
!78 = !DILocation(line: 122, column: 22, scope: !69)
!79 = !DILocation(line: 122, column: 12, scope: !69)
!80 = !DILocation(line: 122, column: 5, scope: !69)
!81 = !DILocation(line: 124, column: 5, scope: !69)
!82 = !DILocation(line: 125, column: 5, scope: !69)
!83 = !DILocation(line: 126, column: 5, scope: !69)
!84 = !DILocation(line: 129, column: 5, scope: !69)
!85 = !DILocation(line: 130, column: 5, scope: !69)
!86 = !DILocation(line: 131, column: 5, scope: !69)
!87 = !DILocation(line: 133, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 60, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !88, file: !6, line: 60, column: 8)
!91 = !DILocation(line: 60, column: 8, scope: !88)
!92 = !DILocation(line: 63, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !6, line: 61, column: 5)
!94 = !DILocation(line: 64, column: 5, scope: !93)
!95 = !DILocalVariable(name: "structCharVoid", scope: !96, file: !6, line: 68, type: !4)
!96 = distinct !DILexicalBlock(scope: !97, file: !6, line: 67, column: 9)
!97 = distinct !DILexicalBlock(scope: !90, file: !6, line: 66, column: 5)
!98 = !DILocation(line: 68, column: 24, scope: !96)
!99 = !DILocation(line: 68, column: 53, scope: !96)
!100 = !DILocation(line: 68, column: 41, scope: !96)
!101 = !DILocation(line: 69, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !6, line: 69, column: 17)
!103 = !DILocation(line: 69, column: 32, scope: !102)
!104 = !DILocation(line: 69, column: 17, scope: !96)
!105 = !DILocation(line: 69, column: 42, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !6, line: 69, column: 41)
!107 = !DILocation(line: 70, column: 13, scope: !96)
!108 = !DILocation(line: 70, column: 29, scope: !96)
!109 = !DILocation(line: 70, column: 40, scope: !96)
!110 = !DILocation(line: 72, column: 31, scope: !96)
!111 = !DILocation(line: 72, column: 47, scope: !96)
!112 = !DILocation(line: 72, column: 13, scope: !96)
!113 = !DILocation(line: 74, column: 20, scope: !96)
!114 = !DILocation(line: 74, column: 36, scope: !96)
!115 = !DILocation(line: 74, column: 13, scope: !96)
!116 = !DILocation(line: 75, column: 13, scope: !96)
!117 = !DILocation(line: 75, column: 29, scope: !96)
!118 = !DILocation(line: 75, column: 91, scope: !96)
!119 = !DILocation(line: 76, column: 31, scope: !96)
!120 = !DILocation(line: 76, column: 47, scope: !96)
!121 = !DILocation(line: 76, column: 13, scope: !96)
!122 = !DILocation(line: 77, column: 31, scope: !96)
!123 = !DILocation(line: 77, column: 47, scope: !96)
!124 = !DILocation(line: 77, column: 13, scope: !96)
!125 = !DILocation(line: 78, column: 18, scope: !96)
!126 = !DILocation(line: 78, column: 13, scope: !96)
!127 = !DILocation(line: 81, column: 1, scope: !88)
!128 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 84, type: !26, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocation(line: 86, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !128, file: !6, line: 86, column: 8)
!131 = !DILocation(line: 86, column: 8, scope: !128)
!132 = !DILocalVariable(name: "structCharVoid", scope: !133, file: !6, line: 89, type: !4)
!133 = distinct !DILexicalBlock(scope: !134, file: !6, line: 88, column: 9)
!134 = distinct !DILexicalBlock(scope: !130, file: !6, line: 87, column: 5)
!135 = !DILocation(line: 89, column: 24, scope: !133)
!136 = !DILocation(line: 89, column: 53, scope: !133)
!137 = !DILocation(line: 89, column: 41, scope: !133)
!138 = !DILocation(line: 90, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !6, line: 90, column: 17)
!140 = !DILocation(line: 90, column: 32, scope: !139)
!141 = !DILocation(line: 90, column: 17, scope: !133)
!142 = !DILocation(line: 90, column: 42, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !6, line: 90, column: 41)
!144 = !DILocation(line: 91, column: 13, scope: !133)
!145 = !DILocation(line: 91, column: 29, scope: !133)
!146 = !DILocation(line: 91, column: 40, scope: !133)
!147 = !DILocation(line: 93, column: 31, scope: !133)
!148 = !DILocation(line: 93, column: 47, scope: !133)
!149 = !DILocation(line: 93, column: 13, scope: !133)
!150 = !DILocation(line: 95, column: 20, scope: !133)
!151 = !DILocation(line: 95, column: 36, scope: !133)
!152 = !DILocation(line: 95, column: 13, scope: !133)
!153 = !DILocation(line: 96, column: 13, scope: !133)
!154 = !DILocation(line: 96, column: 29, scope: !133)
!155 = !DILocation(line: 96, column: 91, scope: !133)
!156 = !DILocation(line: 97, column: 31, scope: !133)
!157 = !DILocation(line: 97, column: 47, scope: !133)
!158 = !DILocation(line: 97, column: 13, scope: !133)
!159 = !DILocation(line: 98, column: 31, scope: !133)
!160 = !DILocation(line: 98, column: 47, scope: !133)
!161 = !DILocation(line: 98, column: 13, scope: !133)
!162 = !DILocation(line: 99, column: 18, scope: !133)
!163 = !DILocation(line: 99, column: 13, scope: !133)
!164 = !DILocation(line: 101, column: 5, scope: !134)
!165 = !DILocation(line: 102, column: 1, scope: !128)
