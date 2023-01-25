; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17_bad() #0 !dbg !27 {
entry:
  %j = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata i32* %j, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %j, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !39, metadata !DIExpression()), !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !43
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !44
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !42
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !47
  br i1 %cmp1, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %for.body
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !52
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !53
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !55
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !55
  %6 = bitcast i8* %5 to i32*, !dbg !56
  call void @printWLine(i32* %6), !dbg !57
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !59
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !60
  %8 = bitcast i32* %arraydecay to i8*, !dbg !60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !60
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !62
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !64
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !65
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay5), !dbg !66
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !67
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !68
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !68
  %13 = bitcast i8* %12 to i32*, !dbg !69
  call void @printWLine(i32* %13), !dbg !70
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !71
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !71
  call void @free(i8* %15) #6, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %if.end
  %16 = load i32, i32* %j, align 4, !dbg !74
  %inc = add nsw i32 %16, 1, !dbg !74
  store i32 %inc, i32* %j, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  ret void, !dbg !79
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17_good() #0 !dbg !80 {
entry:
  call void @good1(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #6, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #6, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !103 {
entry:
  %k = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata i32* %k, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 0, i32* %k, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !109
  %cmp = icmp slt i32 %0, 1, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !113, metadata !DIExpression()), !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !117
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !118
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !116
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !121
  br i1 %cmp1, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %for.body
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !126
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !127
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !129
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !129
  %6 = bitcast i8* %5 to i32*, !dbg !130
  call void @printWLine(i32* %6), !dbg !131
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !132
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !133
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !134
  %8 = bitcast i32* %arraydecay to i8*, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !134
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !135
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !136
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !138
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !139
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !138
  call void @printWLine(i32* %arraydecay5), !dbg !140
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !141
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !142
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !142
  %13 = bitcast i8* %12 to i32*, !dbg !143
  call void @printWLine(i32* %13), !dbg !144
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !145
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !145
  call void @free(i8* %15) #6, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %if.end
  %16 = load i32, i32* %k, align 4, !dbg !148
  %inc = add nsw i32 %16, 1, !dbg !148
  store i32 %inc, i32* %k, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  ret void, !dbg !152
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "j", scope: !27, file: !6, line: 35, type: !13)
!31 = !DILocation(line: 35, column: 9, scope: !27)
!32 = !DILocation(line: 36, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !6, line: 36, column: 5)
!34 = !DILocation(line: 36, column: 9, scope: !33)
!35 = !DILocation(line: 36, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !6, line: 36, column: 5)
!37 = !DILocation(line: 36, column: 18, scope: !36)
!38 = !DILocation(line: 36, column: 5, scope: !33)
!39 = !DILocalVariable(name: "structCharVoid", scope: !40, file: !6, line: 39, type: !4)
!40 = distinct !DILexicalBlock(scope: !41, file: !6, line: 38, column: 9)
!41 = distinct !DILexicalBlock(scope: !36, file: !6, line: 37, column: 5)
!42 = !DILocation(line: 39, column: 24, scope: !40)
!43 = !DILocation(line: 39, column: 53, scope: !40)
!44 = !DILocation(line: 39, column: 41, scope: !40)
!45 = !DILocation(line: 40, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !6, line: 40, column: 17)
!47 = !DILocation(line: 40, column: 32, scope: !46)
!48 = !DILocation(line: 40, column: 17, scope: !40)
!49 = !DILocation(line: 40, column: 42, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !6, line: 40, column: 41)
!51 = !DILocation(line: 41, column: 13, scope: !40)
!52 = !DILocation(line: 41, column: 29, scope: !40)
!53 = !DILocation(line: 41, column: 40, scope: !40)
!54 = !DILocation(line: 43, column: 35, scope: !40)
!55 = !DILocation(line: 43, column: 51, scope: !40)
!56 = !DILocation(line: 43, column: 24, scope: !40)
!57 = !DILocation(line: 43, column: 13, scope: !40)
!58 = !DILocation(line: 45, column: 20, scope: !40)
!59 = !DILocation(line: 45, column: 36, scope: !40)
!60 = !DILocation(line: 45, column: 13, scope: !40)
!61 = !DILocation(line: 46, column: 13, scope: !40)
!62 = !DILocation(line: 46, column: 29, scope: !40)
!63 = !DILocation(line: 46, column: 94, scope: !40)
!64 = !DILocation(line: 47, column: 35, scope: !40)
!65 = !DILocation(line: 47, column: 51, scope: !40)
!66 = !DILocation(line: 47, column: 13, scope: !40)
!67 = !DILocation(line: 48, column: 35, scope: !40)
!68 = !DILocation(line: 48, column: 51, scope: !40)
!69 = !DILocation(line: 48, column: 24, scope: !40)
!70 = !DILocation(line: 48, column: 13, scope: !40)
!71 = !DILocation(line: 49, column: 18, scope: !40)
!72 = !DILocation(line: 49, column: 13, scope: !40)
!73 = !DILocation(line: 51, column: 5, scope: !41)
!74 = !DILocation(line: 36, column: 24, scope: !36)
!75 = !DILocation(line: 36, column: 5, scope: !36)
!76 = distinct !{!76, !38, !77, !78}
!77 = !DILocation(line: 51, column: 5, scope: !33)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 52, column: 1, scope: !27)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_17_good", scope: !6, file: !6, line: 80, type: !28, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 82, column: 5, scope: !80)
!82 = !DILocation(line: 83, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 94, type: !84, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!13, !13, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !6, line: 94, type: !13)
!90 = !DILocation(line: 94, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !6, line: 94, type: !86)
!92 = !DILocation(line: 94, column: 27, scope: !83)
!93 = !DILocation(line: 97, column: 22, scope: !83)
!94 = !DILocation(line: 97, column: 12, scope: !83)
!95 = !DILocation(line: 97, column: 5, scope: !83)
!96 = !DILocation(line: 99, column: 5, scope: !83)
!97 = !DILocation(line: 100, column: 5, scope: !83)
!98 = !DILocation(line: 101, column: 5, scope: !83)
!99 = !DILocation(line: 104, column: 5, scope: !83)
!100 = !DILocation(line: 105, column: 5, scope: !83)
!101 = !DILocation(line: 106, column: 5, scope: !83)
!102 = !DILocation(line: 108, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 59, type: !28, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "k", scope: !103, file: !6, line: 61, type: !13)
!105 = !DILocation(line: 61, column: 9, scope: !103)
!106 = !DILocation(line: 62, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !6, line: 62, column: 5)
!108 = !DILocation(line: 62, column: 9, scope: !107)
!109 = !DILocation(line: 62, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !6, line: 62, column: 5)
!111 = !DILocation(line: 62, column: 18, scope: !110)
!112 = !DILocation(line: 62, column: 5, scope: !107)
!113 = !DILocalVariable(name: "structCharVoid", scope: !114, file: !6, line: 65, type: !4)
!114 = distinct !DILexicalBlock(scope: !115, file: !6, line: 64, column: 9)
!115 = distinct !DILexicalBlock(scope: !110, file: !6, line: 63, column: 5)
!116 = !DILocation(line: 65, column: 24, scope: !114)
!117 = !DILocation(line: 65, column: 53, scope: !114)
!118 = !DILocation(line: 65, column: 41, scope: !114)
!119 = !DILocation(line: 66, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !6, line: 66, column: 17)
!121 = !DILocation(line: 66, column: 32, scope: !120)
!122 = !DILocation(line: 66, column: 17, scope: !114)
!123 = !DILocation(line: 66, column: 42, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !6, line: 66, column: 41)
!125 = !DILocation(line: 67, column: 13, scope: !114)
!126 = !DILocation(line: 67, column: 29, scope: !114)
!127 = !DILocation(line: 67, column: 40, scope: !114)
!128 = !DILocation(line: 69, column: 35, scope: !114)
!129 = !DILocation(line: 69, column: 51, scope: !114)
!130 = !DILocation(line: 69, column: 24, scope: !114)
!131 = !DILocation(line: 69, column: 13, scope: !114)
!132 = !DILocation(line: 71, column: 20, scope: !114)
!133 = !DILocation(line: 71, column: 36, scope: !114)
!134 = !DILocation(line: 71, column: 13, scope: !114)
!135 = !DILocation(line: 72, column: 13, scope: !114)
!136 = !DILocation(line: 72, column: 29, scope: !114)
!137 = !DILocation(line: 72, column: 94, scope: !114)
!138 = !DILocation(line: 73, column: 35, scope: !114)
!139 = !DILocation(line: 73, column: 51, scope: !114)
!140 = !DILocation(line: 73, column: 13, scope: !114)
!141 = !DILocation(line: 74, column: 35, scope: !114)
!142 = !DILocation(line: 74, column: 51, scope: !114)
!143 = !DILocation(line: 74, column: 24, scope: !114)
!144 = !DILocation(line: 74, column: 13, scope: !114)
!145 = !DILocation(line: 75, column: 18, scope: !114)
!146 = !DILocation(line: 75, column: 13, scope: !114)
!147 = !DILocation(line: 77, column: 5, scope: !115)
!148 = !DILocation(line: 62, column: 24, scope: !110)
!149 = !DILocation(line: 62, column: 5, scope: !110)
!150 = distinct !{!150, !112, !151, !78}
!151 = !DILocation(line: 77, column: 5, scope: !107)
!152 = !DILocation(line: 78, column: 1, scope: !103)
