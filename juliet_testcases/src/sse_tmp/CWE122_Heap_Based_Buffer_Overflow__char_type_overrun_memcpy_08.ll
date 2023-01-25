; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08_bad() #0 !dbg !25 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !51
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
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !61
  call void @free(i8* %11) #6, !dbg !62
  br label %if.end8, !dbg !63

if.end8:                                          ; preds = %if.end, %entry
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08_good() #0 !dbg !65 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !88 {
entry:
  ret i32 1, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !92 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsFalse(), !dbg !93
  %tobool = icmp ne i32 %call, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !96
  br label %if.end8, !dbg !98

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !99, metadata !DIExpression()), !dbg !102
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !103
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !104
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !102
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !105
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !107
  br i1 %cmp, label %if.then2, label %if.end, !dbg !108

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %if.else
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !111
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !112
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !113
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !114
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !115
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !115
  call void @printLine(i8* %4), !dbg !116
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !118
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !119
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !120
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !121
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !123
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !124
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay6), !dbg !125
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !126
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !127
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !127
  call void @printLine(i8* %9), !dbg !128
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !129
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !129
  call void @free(i8* %11) #6, !dbg !130
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !132 {
entry:
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !134 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !135
  %tobool = icmp ne i32 %call, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end8, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !138, metadata !DIExpression()), !dbg !141
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !142
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !143
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !141
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !146
  br i1 %cmp, label %if.then2, label %if.end, !dbg !147

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !151
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !152
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !154
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !154
  call void @printLine(i8* %4), !dbg !155
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !156
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !157
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !158
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !158
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !159
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !160
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !161
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !162
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !163
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !162
  call void @printLine(i8* %arraydecay6), !dbg !164
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !165
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !166
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !166
  call void @printLine(i8* %9), !dbg !167
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !168
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !168
  call void @free(i8* %11) #6, !dbg !169
  br label %if.end8, !dbg !170

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !171
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08_bad", scope: !6, file: !6, line: 46, type: !26, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!49 = !DILocation(line: 57, column: 20, scope: !32)
!50 = !DILocation(line: 57, column: 36, scope: !32)
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
!61 = !DILocation(line: 61, column: 18, scope: !32)
!62 = !DILocation(line: 61, column: 13, scope: !32)
!63 = !DILocation(line: 63, column: 5, scope: !33)
!64 = !DILocation(line: 64, column: 1, scope: !25)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_08_good", scope: !6, file: !6, line: 117, type: !26, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 119, column: 5, scope: !65)
!67 = !DILocation(line: 120, column: 5, scope: !65)
!68 = !DILocation(line: 121, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 132, type: !70, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !73}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !6, line: 132, type: !72)
!75 = !DILocation(line: 132, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !6, line: 132, type: !73)
!77 = !DILocation(line: 132, column: 27, scope: !69)
!78 = !DILocation(line: 135, column: 22, scope: !69)
!79 = !DILocation(line: 135, column: 12, scope: !69)
!80 = !DILocation(line: 135, column: 5, scope: !69)
!81 = !DILocation(line: 137, column: 5, scope: !69)
!82 = !DILocation(line: 138, column: 5, scope: !69)
!83 = !DILocation(line: 139, column: 5, scope: !69)
!84 = !DILocation(line: 142, column: 5, scope: !69)
!85 = !DILocation(line: 143, column: 5, scope: !69)
!86 = !DILocation(line: 144, column: 5, scope: !69)
!87 = !DILocation(line: 146, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !6, file: !6, line: 34, type: !89, scopeLine: 35, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!72}
!91 = !DILocation(line: 36, column: 5, scope: !88)
!92 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 71, type: !26, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 73, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !6, line: 73, column: 8)
!95 = !DILocation(line: 73, column: 8, scope: !92)
!96 = !DILocation(line: 76, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !6, line: 74, column: 5)
!98 = !DILocation(line: 77, column: 5, scope: !97)
!99 = !DILocalVariable(name: "structCharVoid", scope: !100, file: !6, line: 81, type: !4)
!100 = distinct !DILexicalBlock(scope: !101, file: !6, line: 80, column: 9)
!101 = distinct !DILexicalBlock(scope: !94, file: !6, line: 79, column: 5)
!102 = !DILocation(line: 81, column: 24, scope: !100)
!103 = !DILocation(line: 81, column: 53, scope: !100)
!104 = !DILocation(line: 81, column: 41, scope: !100)
!105 = !DILocation(line: 82, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !6, line: 82, column: 17)
!107 = !DILocation(line: 82, column: 32, scope: !106)
!108 = !DILocation(line: 82, column: 17, scope: !100)
!109 = !DILocation(line: 82, column: 42, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !6, line: 82, column: 41)
!111 = !DILocation(line: 83, column: 13, scope: !100)
!112 = !DILocation(line: 83, column: 29, scope: !100)
!113 = !DILocation(line: 83, column: 40, scope: !100)
!114 = !DILocation(line: 85, column: 31, scope: !100)
!115 = !DILocation(line: 85, column: 47, scope: !100)
!116 = !DILocation(line: 85, column: 13, scope: !100)
!117 = !DILocation(line: 87, column: 20, scope: !100)
!118 = !DILocation(line: 87, column: 36, scope: !100)
!119 = !DILocation(line: 87, column: 13, scope: !100)
!120 = !DILocation(line: 88, column: 13, scope: !100)
!121 = !DILocation(line: 88, column: 29, scope: !100)
!122 = !DILocation(line: 88, column: 91, scope: !100)
!123 = !DILocation(line: 89, column: 31, scope: !100)
!124 = !DILocation(line: 89, column: 47, scope: !100)
!125 = !DILocation(line: 89, column: 13, scope: !100)
!126 = !DILocation(line: 90, column: 31, scope: !100)
!127 = !DILocation(line: 90, column: 47, scope: !100)
!128 = !DILocation(line: 90, column: 13, scope: !100)
!129 = !DILocation(line: 91, column: 18, scope: !100)
!130 = !DILocation(line: 91, column: 13, scope: !100)
!131 = !DILocation(line: 94, column: 1, scope: !92)
!132 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !6, file: !6, line: 39, type: !89, scopeLine: 40, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocation(line: 41, column: 5, scope: !132)
!134 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 97, type: !26, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocation(line: 99, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !134, file: !6, line: 99, column: 8)
!137 = !DILocation(line: 99, column: 8, scope: !134)
!138 = !DILocalVariable(name: "structCharVoid", scope: !139, file: !6, line: 102, type: !4)
!139 = distinct !DILexicalBlock(scope: !140, file: !6, line: 101, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !6, line: 100, column: 5)
!141 = !DILocation(line: 102, column: 24, scope: !139)
!142 = !DILocation(line: 102, column: 53, scope: !139)
!143 = !DILocation(line: 102, column: 41, scope: !139)
!144 = !DILocation(line: 103, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !6, line: 103, column: 17)
!146 = !DILocation(line: 103, column: 32, scope: !145)
!147 = !DILocation(line: 103, column: 17, scope: !139)
!148 = !DILocation(line: 103, column: 42, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !6, line: 103, column: 41)
!150 = !DILocation(line: 104, column: 13, scope: !139)
!151 = !DILocation(line: 104, column: 29, scope: !139)
!152 = !DILocation(line: 104, column: 40, scope: !139)
!153 = !DILocation(line: 106, column: 31, scope: !139)
!154 = !DILocation(line: 106, column: 47, scope: !139)
!155 = !DILocation(line: 106, column: 13, scope: !139)
!156 = !DILocation(line: 108, column: 20, scope: !139)
!157 = !DILocation(line: 108, column: 36, scope: !139)
!158 = !DILocation(line: 108, column: 13, scope: !139)
!159 = !DILocation(line: 109, column: 13, scope: !139)
!160 = !DILocation(line: 109, column: 29, scope: !139)
!161 = !DILocation(line: 109, column: 91, scope: !139)
!162 = !DILocation(line: 110, column: 31, scope: !139)
!163 = !DILocation(line: 110, column: 47, scope: !139)
!164 = !DILocation(line: 110, column: 13, scope: !139)
!165 = !DILocation(line: 111, column: 31, scope: !139)
!166 = !DILocation(line: 111, column: 47, scope: !139)
!167 = !DILocation(line: 111, column: 13, scope: !139)
!168 = !DILocation(line: 112, column: 18, scope: !139)
!169 = !DILocation(line: 112, column: 13, scope: !139)
!170 = !DILocation(line: 114, column: 5, scope: !140)
!171 = !DILocation(line: 115, column: 1, scope: !134)
