; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_bad() #0 !dbg !27 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !60
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
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %j, align 4, !dbg !72
  %inc = add nsw i32 %14, 1, !dbg !72
  store i32 %inc, i32* %j, align 4, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_good() #0 !dbg !78 {
entry:
  call void @good1(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !101 {
entry:
  %k = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata i32* %k, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 0, i32* %k, align 4, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !107
  %cmp = icmp slt i32 %0, 1, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !111, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !115
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !116
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !114
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !119
  br i1 %cmp1, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %for.body
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !123
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !124
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !125
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !126
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !127
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !127
  %6 = bitcast i8* %5 to i32*, !dbg !128
  call void @printWLine(i32* %6), !dbg !129
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !131
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !132
  %8 = bitcast i32* %arraydecay to i8*, !dbg !132
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !132
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !134
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !136
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !137
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !136
  call void @printWLine(i32* %arraydecay5), !dbg !138
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !139
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !140
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !140
  %13 = bitcast i8* %12 to i32*, !dbg !141
  call void @printWLine(i32* %13), !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %k, align 4, !dbg !144
  %inc = add nsw i32 %14, 1, !dbg !144
  store i32 %inc, i32* %k, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
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
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!58 = !DILocation(line: 45, column: 21, scope: !40)
!59 = !DILocation(line: 45, column: 37, scope: !40)
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
!71 = !DILocation(line: 50, column: 5, scope: !41)
!72 = !DILocation(line: 36, column: 24, scope: !36)
!73 = !DILocation(line: 36, column: 5, scope: !36)
!74 = distinct !{!74, !38, !75, !76}
!75 = !DILocation(line: 50, column: 5, scope: !33)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 51, column: 1, scope: !27)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_good", scope: !6, file: !6, line: 78, type: !28, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 80, column: 5, scope: !78)
!80 = !DILocation(line: 81, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 92, type: !82, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!13, !13, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !6, line: 92, type: !13)
!88 = !DILocation(line: 92, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !6, line: 92, type: !84)
!90 = !DILocation(line: 92, column: 27, scope: !81)
!91 = !DILocation(line: 95, column: 22, scope: !81)
!92 = !DILocation(line: 95, column: 12, scope: !81)
!93 = !DILocation(line: 95, column: 5, scope: !81)
!94 = !DILocation(line: 97, column: 5, scope: !81)
!95 = !DILocation(line: 98, column: 5, scope: !81)
!96 = !DILocation(line: 99, column: 5, scope: !81)
!97 = !DILocation(line: 102, column: 5, scope: !81)
!98 = !DILocation(line: 103, column: 5, scope: !81)
!99 = !DILocation(line: 104, column: 5, scope: !81)
!100 = !DILocation(line: 106, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 58, type: !28, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "k", scope: !101, file: !6, line: 60, type: !13)
!103 = !DILocation(line: 60, column: 9, scope: !101)
!104 = !DILocation(line: 61, column: 11, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !6, line: 61, column: 5)
!106 = !DILocation(line: 61, column: 9, scope: !105)
!107 = !DILocation(line: 61, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !6, line: 61, column: 5)
!109 = !DILocation(line: 61, column: 18, scope: !108)
!110 = !DILocation(line: 61, column: 5, scope: !105)
!111 = !DILocalVariable(name: "structCharVoid", scope: !112, file: !6, line: 64, type: !4)
!112 = distinct !DILexicalBlock(scope: !113, file: !6, line: 63, column: 9)
!113 = distinct !DILexicalBlock(scope: !108, file: !6, line: 62, column: 5)
!114 = !DILocation(line: 64, column: 24, scope: !112)
!115 = !DILocation(line: 64, column: 53, scope: !112)
!116 = !DILocation(line: 64, column: 41, scope: !112)
!117 = !DILocation(line: 65, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !6, line: 65, column: 17)
!119 = !DILocation(line: 65, column: 32, scope: !118)
!120 = !DILocation(line: 65, column: 17, scope: !112)
!121 = !DILocation(line: 65, column: 42, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !6, line: 65, column: 41)
!123 = !DILocation(line: 66, column: 13, scope: !112)
!124 = !DILocation(line: 66, column: 29, scope: !112)
!125 = !DILocation(line: 66, column: 40, scope: !112)
!126 = !DILocation(line: 68, column: 35, scope: !112)
!127 = !DILocation(line: 68, column: 51, scope: !112)
!128 = !DILocation(line: 68, column: 24, scope: !112)
!129 = !DILocation(line: 68, column: 13, scope: !112)
!130 = !DILocation(line: 70, column: 21, scope: !112)
!131 = !DILocation(line: 70, column: 37, scope: !112)
!132 = !DILocation(line: 70, column: 13, scope: !112)
!133 = !DILocation(line: 71, column: 13, scope: !112)
!134 = !DILocation(line: 71, column: 29, scope: !112)
!135 = !DILocation(line: 71, column: 94, scope: !112)
!136 = !DILocation(line: 72, column: 35, scope: !112)
!137 = !DILocation(line: 72, column: 51, scope: !112)
!138 = !DILocation(line: 72, column: 13, scope: !112)
!139 = !DILocation(line: 73, column: 35, scope: !112)
!140 = !DILocation(line: 73, column: 51, scope: !112)
!141 = !DILocation(line: 73, column: 24, scope: !112)
!142 = !DILocation(line: 73, column: 13, scope: !112)
!143 = !DILocation(line: 75, column: 5, scope: !113)
!144 = !DILocation(line: 61, column: 24, scope: !108)
!145 = !DILocation(line: 61, column: 5, scope: !108)
!146 = distinct !{!146, !110, !147, !76}
!147 = !DILocation(line: 75, column: 5, scope: !105)
!148 = !DILocation(line: 76, column: 1, scope: !101)
