; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end8, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !31, metadata !DIExpression()), !dbg !34
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !35
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !36
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !34
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !37
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !39
  br i1 %cmp, label %if.then2, label %if.end, !dbg !40

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !44
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !45
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !46
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !47
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !47
  call void @printLine(i8* %4), !dbg !48
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !50
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !51
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !53
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !56
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay6), !dbg !57
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !59
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !59
  call void @printLine(i8* %9), !dbg !60
  br label %if.end8, !dbg !61

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !62
}

declare dso_local i32 @globalReturnsTrue(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printLine(i8*) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11_good() #0 !dbg !63 {
entry:
  call void @good1(), !dbg !64
  call void @good2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !86 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  br label %if.end8, !dbg !92

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !93, metadata !DIExpression()), !dbg !96
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !97
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !98
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !96
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !99
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !101
  br i1 %cmp, label %if.then2, label %if.end, !dbg !102

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !105
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !106
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !107
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !108
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !109
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !109
  call void @printLine(i8* %4), !dbg !110
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !111
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !112
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !113
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !113
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !114
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !115
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !118
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !117
  call void @printLine(i8* %arraydecay6), !dbg !119
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !120
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !121
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !121
  call void @printLine(i8* %9), !dbg !122
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !123
}

declare dso_local i32 @globalReturnsFalse(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !124 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end8, !dbg !127

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !128, metadata !DIExpression()), !dbg !131
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !132
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !133
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !131
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !134
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !136
  br i1 %cmp, label %if.then2, label %if.end, !dbg !137

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !141
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !142
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !144
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !144
  call void @printLine(i8* %4), !dbg !145
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !147
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !148
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !148
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !150
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !153
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !152
  call void @printLine(i8* %arraydecay6), !dbg !154
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !156
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !156
  call void @printLine(i8* %9), !dbg !157
  br label %if.end8, !dbg !158

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!49 = !DILocation(line: 44, column: 21, scope: !32)
!50 = !DILocation(line: 44, column: 37, scope: !32)
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
!61 = !DILocation(line: 49, column: 5, scope: !33)
!62 = !DILocation(line: 50, column: 1, scope: !25)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_11_good", scope: !6, file: !6, line: 101, type: !26, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 103, column: 5, scope: !63)
!65 = !DILocation(line: 104, column: 5, scope: !63)
!66 = !DILocation(line: 105, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 116, type: !68, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !6, line: 116, type: !70)
!73 = !DILocation(line: 116, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !6, line: 116, type: !71)
!75 = !DILocation(line: 116, column: 27, scope: !67)
!76 = !DILocation(line: 119, column: 22, scope: !67)
!77 = !DILocation(line: 119, column: 12, scope: !67)
!78 = !DILocation(line: 119, column: 5, scope: !67)
!79 = !DILocation(line: 121, column: 5, scope: !67)
!80 = !DILocation(line: 122, column: 5, scope: !67)
!81 = !DILocation(line: 123, column: 5, scope: !67)
!82 = !DILocation(line: 126, column: 5, scope: !67)
!83 = !DILocation(line: 127, column: 5, scope: !67)
!84 = !DILocation(line: 128, column: 5, scope: !67)
!85 = !DILocation(line: 130, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 57, type: !26, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 59, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !86, file: !6, line: 59, column: 8)
!89 = !DILocation(line: 59, column: 8, scope: !86)
!90 = !DILocation(line: 62, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !6, line: 60, column: 5)
!92 = !DILocation(line: 63, column: 5, scope: !91)
!93 = !DILocalVariable(name: "structCharVoid", scope: !94, file: !6, line: 67, type: !4)
!94 = distinct !DILexicalBlock(scope: !95, file: !6, line: 66, column: 9)
!95 = distinct !DILexicalBlock(scope: !88, file: !6, line: 65, column: 5)
!96 = !DILocation(line: 67, column: 24, scope: !94)
!97 = !DILocation(line: 67, column: 53, scope: !94)
!98 = !DILocation(line: 67, column: 41, scope: !94)
!99 = !DILocation(line: 68, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !6, line: 68, column: 17)
!101 = !DILocation(line: 68, column: 32, scope: !100)
!102 = !DILocation(line: 68, column: 17, scope: !94)
!103 = !DILocation(line: 68, column: 42, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !6, line: 68, column: 41)
!105 = !DILocation(line: 69, column: 13, scope: !94)
!106 = !DILocation(line: 69, column: 29, scope: !94)
!107 = !DILocation(line: 69, column: 40, scope: !94)
!108 = !DILocation(line: 71, column: 31, scope: !94)
!109 = !DILocation(line: 71, column: 47, scope: !94)
!110 = !DILocation(line: 71, column: 13, scope: !94)
!111 = !DILocation(line: 73, column: 21, scope: !94)
!112 = !DILocation(line: 73, column: 37, scope: !94)
!113 = !DILocation(line: 73, column: 13, scope: !94)
!114 = !DILocation(line: 74, column: 13, scope: !94)
!115 = !DILocation(line: 74, column: 29, scope: !94)
!116 = !DILocation(line: 74, column: 91, scope: !94)
!117 = !DILocation(line: 75, column: 31, scope: !94)
!118 = !DILocation(line: 75, column: 47, scope: !94)
!119 = !DILocation(line: 75, column: 13, scope: !94)
!120 = !DILocation(line: 76, column: 31, scope: !94)
!121 = !DILocation(line: 76, column: 47, scope: !94)
!122 = !DILocation(line: 76, column: 13, scope: !94)
!123 = !DILocation(line: 79, column: 1, scope: !86)
!124 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 82, type: !26, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocation(line: 84, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !124, file: !6, line: 84, column: 8)
!127 = !DILocation(line: 84, column: 8, scope: !124)
!128 = !DILocalVariable(name: "structCharVoid", scope: !129, file: !6, line: 87, type: !4)
!129 = distinct !DILexicalBlock(scope: !130, file: !6, line: 86, column: 9)
!130 = distinct !DILexicalBlock(scope: !126, file: !6, line: 85, column: 5)
!131 = !DILocation(line: 87, column: 24, scope: !129)
!132 = !DILocation(line: 87, column: 53, scope: !129)
!133 = !DILocation(line: 87, column: 41, scope: !129)
!134 = !DILocation(line: 88, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !6, line: 88, column: 17)
!136 = !DILocation(line: 88, column: 32, scope: !135)
!137 = !DILocation(line: 88, column: 17, scope: !129)
!138 = !DILocation(line: 88, column: 42, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !6, line: 88, column: 41)
!140 = !DILocation(line: 89, column: 13, scope: !129)
!141 = !DILocation(line: 89, column: 29, scope: !129)
!142 = !DILocation(line: 89, column: 40, scope: !129)
!143 = !DILocation(line: 91, column: 31, scope: !129)
!144 = !DILocation(line: 91, column: 47, scope: !129)
!145 = !DILocation(line: 91, column: 13, scope: !129)
!146 = !DILocation(line: 93, column: 21, scope: !129)
!147 = !DILocation(line: 93, column: 37, scope: !129)
!148 = !DILocation(line: 93, column: 13, scope: !129)
!149 = !DILocation(line: 94, column: 13, scope: !129)
!150 = !DILocation(line: 94, column: 29, scope: !129)
!151 = !DILocation(line: 94, column: 91, scope: !129)
!152 = !DILocation(line: 95, column: 31, scope: !129)
!153 = !DILocation(line: 95, column: 47, scope: !129)
!154 = !DILocation(line: 95, column: 13, scope: !129)
!155 = !DILocation(line: 96, column: 31, scope: !129)
!156 = !DILocation(line: 96, column: 47, scope: !129)
!157 = !DILocation(line: 96, column: 13, scope: !129)
!158 = !DILocation(line: 98, column: 5, scope: !130)
!159 = !DILocation(line: 99, column: 1, scope: !124)
