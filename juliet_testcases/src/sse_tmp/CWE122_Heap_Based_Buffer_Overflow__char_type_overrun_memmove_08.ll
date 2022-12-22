; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !28
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08_good() #0 !dbg !63 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !86 {
entry:
  ret i32 1, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !90 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end8, !dbg !96

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !97, metadata !DIExpression()), !dbg !100
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !101
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !102
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !100
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !105
  br i1 %cmp, label %if.then2, label %if.end, !dbg !106

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %if.else
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !110
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !111
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !113
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !113
  call void @printLine(i8* %4), !dbg !114
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !116
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !117
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !117
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !119
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !121
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !122
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !121
  call void @printLine(i8* %arraydecay6), !dbg !123
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !125
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !125
  call void @printLine(i8* %9), !dbg !126
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !128 {
entry:
  ret i32 0, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !130 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !131
  %tobool = icmp ne i32 %call, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end8, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !134, metadata !DIExpression()), !dbg !137
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !138
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !139
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !142
  br i1 %cmp, label %if.then2, label %if.end, !dbg !143

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !147
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !148
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !150
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !150
  call void @printLine(i8* %4), !dbg !151
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !153
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !154
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !156
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !158
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !159
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !158
  call void @printLine(i8* %arraydecay6), !dbg !160
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !161
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !162
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !162
  call void @printLine(i8* %9), !dbg !163
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08_bad", scope: !6, file: !6, line: 46, type: !26, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocation(line: 48, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 48, column: 8)
!30 = !DILocation(line: 48, column: 8, scope: !25)
!31 = !DILocalVariable(name: "structCharVoid", scope: !32, file: !6, line: 51, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !6, line: 50, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !6, line: 49, column: 5)
!34 = !DILocation(line: 51, column: 24, scope: !32)
!35 = !DILocation(line: 51, column: 53, scope: !32)
!36 = !DILocation(line: 51, column: 41, scope: !32)
!37 = !DILocation(line: 52, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !6, line: 52, column: 17)
!39 = !DILocation(line: 52, column: 32, scope: !38)
!40 = !DILocation(line: 52, column: 17, scope: !32)
!41 = !DILocation(line: 52, column: 42, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !6, line: 52, column: 41)
!43 = !DILocation(line: 53, column: 13, scope: !32)
!44 = !DILocation(line: 53, column: 29, scope: !32)
!45 = !DILocation(line: 53, column: 40, scope: !32)
!46 = !DILocation(line: 55, column: 31, scope: !32)
!47 = !DILocation(line: 55, column: 47, scope: !32)
!48 = !DILocation(line: 55, column: 13, scope: !32)
!49 = !DILocation(line: 57, column: 21, scope: !32)
!50 = !DILocation(line: 57, column: 37, scope: !32)
!51 = !DILocation(line: 57, column: 13, scope: !32)
!52 = !DILocation(line: 58, column: 13, scope: !32)
!53 = !DILocation(line: 58, column: 29, scope: !32)
!54 = !DILocation(line: 58, column: 91, scope: !32)
!55 = !DILocation(line: 59, column: 31, scope: !32)
!56 = !DILocation(line: 59, column: 47, scope: !32)
!57 = !DILocation(line: 59, column: 13, scope: !32)
!58 = !DILocation(line: 60, column: 31, scope: !32)
!59 = !DILocation(line: 60, column: 47, scope: !32)
!60 = !DILocation(line: 60, column: 13, scope: !32)
!61 = !DILocation(line: 62, column: 5, scope: !33)
!62 = !DILocation(line: 63, column: 1, scope: !25)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_08_good", scope: !6, file: !6, line: 114, type: !26, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 116, column: 5, scope: !63)
!65 = !DILocation(line: 117, column: 5, scope: !63)
!66 = !DILocation(line: 118, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 129, type: !68, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !6, line: 129, type: !70)
!73 = !DILocation(line: 129, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !6, line: 129, type: !71)
!75 = !DILocation(line: 129, column: 27, scope: !67)
!76 = !DILocation(line: 132, column: 22, scope: !67)
!77 = !DILocation(line: 132, column: 12, scope: !67)
!78 = !DILocation(line: 132, column: 5, scope: !67)
!79 = !DILocation(line: 134, column: 5, scope: !67)
!80 = !DILocation(line: 135, column: 5, scope: !67)
!81 = !DILocation(line: 136, column: 5, scope: !67)
!82 = !DILocation(line: 139, column: 5, scope: !67)
!83 = !DILocation(line: 140, column: 5, scope: !67)
!84 = !DILocation(line: 141, column: 5, scope: !67)
!85 = !DILocation(line: 143, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !6, file: !6, line: 34, type: !87, scopeLine: 35, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!70}
!89 = !DILocation(line: 36, column: 5, scope: !86)
!90 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 70, type: !26, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 72, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !6, line: 72, column: 8)
!93 = !DILocation(line: 72, column: 8, scope: !90)
!94 = !DILocation(line: 75, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !6, line: 73, column: 5)
!96 = !DILocation(line: 76, column: 5, scope: !95)
!97 = !DILocalVariable(name: "structCharVoid", scope: !98, file: !6, line: 80, type: !4)
!98 = distinct !DILexicalBlock(scope: !99, file: !6, line: 79, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !6, line: 78, column: 5)
!100 = !DILocation(line: 80, column: 24, scope: !98)
!101 = !DILocation(line: 80, column: 53, scope: !98)
!102 = !DILocation(line: 80, column: 41, scope: !98)
!103 = !DILocation(line: 81, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !6, line: 81, column: 17)
!105 = !DILocation(line: 81, column: 32, scope: !104)
!106 = !DILocation(line: 81, column: 17, scope: !98)
!107 = !DILocation(line: 81, column: 42, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !6, line: 81, column: 41)
!109 = !DILocation(line: 82, column: 13, scope: !98)
!110 = !DILocation(line: 82, column: 29, scope: !98)
!111 = !DILocation(line: 82, column: 40, scope: !98)
!112 = !DILocation(line: 84, column: 31, scope: !98)
!113 = !DILocation(line: 84, column: 47, scope: !98)
!114 = !DILocation(line: 84, column: 13, scope: !98)
!115 = !DILocation(line: 86, column: 21, scope: !98)
!116 = !DILocation(line: 86, column: 37, scope: !98)
!117 = !DILocation(line: 86, column: 13, scope: !98)
!118 = !DILocation(line: 87, column: 13, scope: !98)
!119 = !DILocation(line: 87, column: 29, scope: !98)
!120 = !DILocation(line: 87, column: 91, scope: !98)
!121 = !DILocation(line: 88, column: 31, scope: !98)
!122 = !DILocation(line: 88, column: 47, scope: !98)
!123 = !DILocation(line: 88, column: 13, scope: !98)
!124 = !DILocation(line: 89, column: 31, scope: !98)
!125 = !DILocation(line: 89, column: 47, scope: !98)
!126 = !DILocation(line: 89, column: 13, scope: !98)
!127 = !DILocation(line: 92, column: 1, scope: !90)
!128 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !6, file: !6, line: 39, type: !87, scopeLine: 40, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocation(line: 41, column: 5, scope: !128)
!130 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 95, type: !26, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocation(line: 97, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !130, file: !6, line: 97, column: 8)
!133 = !DILocation(line: 97, column: 8, scope: !130)
!134 = !DILocalVariable(name: "structCharVoid", scope: !135, file: !6, line: 100, type: !4)
!135 = distinct !DILexicalBlock(scope: !136, file: !6, line: 99, column: 9)
!136 = distinct !DILexicalBlock(scope: !132, file: !6, line: 98, column: 5)
!137 = !DILocation(line: 100, column: 24, scope: !135)
!138 = !DILocation(line: 100, column: 53, scope: !135)
!139 = !DILocation(line: 100, column: 41, scope: !135)
!140 = !DILocation(line: 101, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !6, line: 101, column: 17)
!142 = !DILocation(line: 101, column: 32, scope: !141)
!143 = !DILocation(line: 101, column: 17, scope: !135)
!144 = !DILocation(line: 101, column: 42, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !6, line: 101, column: 41)
!146 = !DILocation(line: 102, column: 13, scope: !135)
!147 = !DILocation(line: 102, column: 29, scope: !135)
!148 = !DILocation(line: 102, column: 40, scope: !135)
!149 = !DILocation(line: 104, column: 31, scope: !135)
!150 = !DILocation(line: 104, column: 47, scope: !135)
!151 = !DILocation(line: 104, column: 13, scope: !135)
!152 = !DILocation(line: 106, column: 21, scope: !135)
!153 = !DILocation(line: 106, column: 37, scope: !135)
!154 = !DILocation(line: 106, column: 13, scope: !135)
!155 = !DILocation(line: 107, column: 13, scope: !135)
!156 = !DILocation(line: 107, column: 29, scope: !135)
!157 = !DILocation(line: 107, column: 91, scope: !135)
!158 = !DILocation(line: 108, column: 31, scope: !135)
!159 = !DILocation(line: 108, column: 47, scope: !135)
!160 = !DILocation(line: 108, column: 13, scope: !135)
!161 = !DILocation(line: 109, column: 31, scope: !135)
!162 = !DILocation(line: 109, column: 47, scope: !135)
!163 = !DILocation(line: 109, column: 13, scope: !135)
!164 = !DILocation(line: 111, column: 5, scope: !136)
!165 = !DILocation(line: 112, column: 1, scope: !130)
