; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %while.body, !dbg !30

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !31, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !35
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !36
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !34
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !37
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %while.body
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !44
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !45
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !46
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !47
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !47
  %5 = bitcast i8* %4 to i32*, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !51
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !52
  %7 = bitcast i32* %arraydecay to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !52
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !54
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !57
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay4), !dbg !58
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !60
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !60
  %12 = bitcast i8* %11 to i32*, !dbg !61
  call void @printWLine(i32* %12), !dbg !62
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !63
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !63
  call void @free(i8* %14) #6, !dbg !64
  br label %while.end, !dbg !65

while.end:                                        ; preds = %if.end
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16_good() #0 !dbg !67 {
entry:
  call void @good1(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !90 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %while.body, !dbg !91

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !96
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !97
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !95
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !98
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %while.body
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !104
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !105
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !106
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !108
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !108
  %5 = bitcast i8* %4 to i32*, !dbg !109
  call void @printWLine(i32* %5), !dbg !110
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !111
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !112
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !113
  %7 = bitcast i32* %arraydecay to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !113
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !114
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !115
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !118
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay4), !dbg !119
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !120
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !121
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !121
  %12 = bitcast i8* %11 to i32*, !dbg !122
  call void @printWLine(i32* %12), !dbg !123
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !124
  call void @free(i8* %14) #6, !dbg !125
  br label %while.end, !dbg !126

while.end:                                        ; preds = %if.end
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16.c", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 35, column: 5, scope: !27)
!31 = !DILocalVariable(name: "structCharVoid", scope: !32, file: !6, line: 38, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !6, line: 37, column: 9)
!33 = distinct !DILexicalBlock(scope: !27, file: !6, line: 36, column: 5)
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
!46 = !DILocation(line: 42, column: 35, scope: !32)
!47 = !DILocation(line: 42, column: 51, scope: !32)
!48 = !DILocation(line: 42, column: 24, scope: !32)
!49 = !DILocation(line: 42, column: 13, scope: !32)
!50 = !DILocation(line: 44, column: 20, scope: !32)
!51 = !DILocation(line: 44, column: 36, scope: !32)
!52 = !DILocation(line: 44, column: 13, scope: !32)
!53 = !DILocation(line: 45, column: 13, scope: !32)
!54 = !DILocation(line: 45, column: 29, scope: !32)
!55 = !DILocation(line: 45, column: 94, scope: !32)
!56 = !DILocation(line: 46, column: 35, scope: !32)
!57 = !DILocation(line: 46, column: 51, scope: !32)
!58 = !DILocation(line: 46, column: 13, scope: !32)
!59 = !DILocation(line: 47, column: 35, scope: !32)
!60 = !DILocation(line: 47, column: 51, scope: !32)
!61 = !DILocation(line: 47, column: 24, scope: !32)
!62 = !DILocation(line: 47, column: 13, scope: !32)
!63 = !DILocation(line: 48, column: 18, scope: !32)
!64 = !DILocation(line: 48, column: 13, scope: !32)
!65 = !DILocation(line: 50, column: 9, scope: !33)
!66 = !DILocation(line: 52, column: 1, scope: !27)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_16_good", scope: !6, file: !6, line: 80, type: !28, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 82, column: 5, scope: !67)
!69 = !DILocation(line: 83, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 94, type: !71, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!13, !13, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !6, line: 94, type: !13)
!77 = !DILocation(line: 94, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !6, line: 94, type: !73)
!79 = !DILocation(line: 94, column: 27, scope: !70)
!80 = !DILocation(line: 97, column: 22, scope: !70)
!81 = !DILocation(line: 97, column: 12, scope: !70)
!82 = !DILocation(line: 97, column: 5, scope: !70)
!83 = !DILocation(line: 99, column: 5, scope: !70)
!84 = !DILocation(line: 100, column: 5, scope: !70)
!85 = !DILocation(line: 101, column: 5, scope: !70)
!86 = !DILocation(line: 104, column: 5, scope: !70)
!87 = !DILocation(line: 105, column: 5, scope: !70)
!88 = !DILocation(line: 106, column: 5, scope: !70)
!89 = !DILocation(line: 108, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 59, type: !28, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 61, column: 5, scope: !90)
!92 = !DILocalVariable(name: "structCharVoid", scope: !93, file: !6, line: 64, type: !4)
!93 = distinct !DILexicalBlock(scope: !94, file: !6, line: 63, column: 9)
!94 = distinct !DILexicalBlock(scope: !90, file: !6, line: 62, column: 5)
!95 = !DILocation(line: 64, column: 24, scope: !93)
!96 = !DILocation(line: 64, column: 53, scope: !93)
!97 = !DILocation(line: 64, column: 41, scope: !93)
!98 = !DILocation(line: 65, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !6, line: 65, column: 17)
!100 = !DILocation(line: 65, column: 32, scope: !99)
!101 = !DILocation(line: 65, column: 17, scope: !93)
!102 = !DILocation(line: 65, column: 42, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !6, line: 65, column: 41)
!104 = !DILocation(line: 66, column: 13, scope: !93)
!105 = !DILocation(line: 66, column: 29, scope: !93)
!106 = !DILocation(line: 66, column: 40, scope: !93)
!107 = !DILocation(line: 68, column: 35, scope: !93)
!108 = !DILocation(line: 68, column: 51, scope: !93)
!109 = !DILocation(line: 68, column: 24, scope: !93)
!110 = !DILocation(line: 68, column: 13, scope: !93)
!111 = !DILocation(line: 70, column: 20, scope: !93)
!112 = !DILocation(line: 70, column: 36, scope: !93)
!113 = !DILocation(line: 70, column: 13, scope: !93)
!114 = !DILocation(line: 71, column: 13, scope: !93)
!115 = !DILocation(line: 71, column: 29, scope: !93)
!116 = !DILocation(line: 71, column: 94, scope: !93)
!117 = !DILocation(line: 72, column: 35, scope: !93)
!118 = !DILocation(line: 72, column: 51, scope: !93)
!119 = !DILocation(line: 72, column: 13, scope: !93)
!120 = !DILocation(line: 73, column: 35, scope: !93)
!121 = !DILocation(line: 73, column: 51, scope: !93)
!122 = !DILocation(line: 73, column: 24, scope: !93)
!123 = !DILocation(line: 73, column: 13, scope: !93)
!124 = !DILocation(line: 74, column: 18, scope: !93)
!125 = !DILocation(line: 74, column: 13, scope: !93)
!126 = !DILocation(line: 76, column: 9, scope: !94)
!127 = !DILocation(line: 78, column: 1, scope: !90)
