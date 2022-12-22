; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_bad() #0 !dbg !16 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %structCharVoid6 = alloca %struct._charVoid, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else, !dbg !22

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !42
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

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid6, metadata !53, metadata !DIExpression()), !dbg !56
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !57
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond7, align 8, !dbg !58
  %voidSecond8 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !59
  %5 = load i8*, i8** %voidSecond8, align 8, !dbg !59
  %6 = bitcast i8* %5 to i32*, !dbg !60
  call void @printWLine(i32* %6), !dbg !61
  %charFirst9 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !62
  %arraydecay10 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst9, i64 0, i64 0, !dbg !63
  %7 = bitcast i32* %arraydecay10 to i8*, !dbg !63
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !63
  %charFirst11 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !64
  %arrayidx12 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst11, i64 0, i64 15, !dbg !65
  store i32 0, i32* %arrayidx12, align 4, !dbg !66
  %charFirst13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !67
  %arraydecay14 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst13, i64 0, i64 0, !dbg !68
  call void @printWLine(i32* %arraydecay14), !dbg !69
  %voidSecond15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !70
  %8 = load i8*, i8** %voidSecond15, align 8, !dbg !70
  %9 = bitcast i8* %8 to i32*, !dbg !71
  call void @printWLine(i32* %9), !dbg !72
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !73
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare dso_local void @printWLine(i32*) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_good() #0 !dbg !74 {
entry:
  call void @good1(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !97 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %structCharVoid6 = alloca %struct._charVoid, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !98
  %tobool = icmp ne i32 %call, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !101, metadata !DIExpression()), !dbg !104
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !105
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !106
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !107
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  call void @printWLine(i32* %1), !dbg !109
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !110
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !111
  %2 = bitcast i32* %arraydecay to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !111
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !112
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !115
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !116
  call void @printWLine(i32* %arraydecay4), !dbg !117
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !118
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !118
  %4 = bitcast i8* %3 to i32*, !dbg !119
  call void @printWLine(i32* %4), !dbg !120
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid6, metadata !122, metadata !DIExpression()), !dbg !125
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !126
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond7, align 8, !dbg !127
  %voidSecond8 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !128
  %5 = load i8*, i8** %voidSecond8, align 8, !dbg !128
  %6 = bitcast i8* %5 to i32*, !dbg !129
  call void @printWLine(i32* %6), !dbg !130
  %charFirst9 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !131
  %arraydecay10 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst9, i64 0, i64 0, !dbg !132
  %7 = bitcast i32* %arraydecay10 to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !132
  %charFirst11 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !133
  %arrayidx12 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst11, i64 0, i64 15, !dbg !134
  store i32 0, i32* %arrayidx12, align 4, !dbg !135
  %charFirst13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !136
  %arraydecay14 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst13, i64 0, i64 0, !dbg !137
  call void @printWLine(i32* %arraydecay14), !dbg !138
  %voidSecond15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !139
  %8 = load i8*, i8** %voidSecond15, align 8, !dbg !139
  %9 = bitcast i8* %8 to i32*, !dbg !140
  call void @printWLine(i32* %9), !dbg !141
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 36, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 8)
!22 = !DILocation(line: 36, column: 8, scope: !16)
!23 = !DILocalVariable(name: "structCharVoid", scope: !24, file: !17, line: 39, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 38, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !17, line: 37, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !28)
!28 = !{!29, !33, !34}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !27, file: !17, line: 27, baseType: !30, size: 512)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 16)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !27, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !27, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!35 = !DILocation(line: 39, column: 22, scope: !24)
!36 = !DILocation(line: 40, column: 28, scope: !24)
!37 = !DILocation(line: 40, column: 39, scope: !24)
!38 = !DILocation(line: 42, column: 50, scope: !24)
!39 = !DILocation(line: 42, column: 24, scope: !24)
!40 = !DILocation(line: 42, column: 13, scope: !24)
!41 = !DILocation(line: 44, column: 35, scope: !24)
!42 = !DILocation(line: 44, column: 13, scope: !24)
!43 = !DILocation(line: 45, column: 28, scope: !24)
!44 = !DILocation(line: 45, column: 13, scope: !24)
!45 = !DILocation(line: 45, column: 92, scope: !24)
!46 = !DILocation(line: 46, column: 50, scope: !24)
!47 = !DILocation(line: 46, column: 35, scope: !24)
!48 = !DILocation(line: 46, column: 13, scope: !24)
!49 = !DILocation(line: 47, column: 50, scope: !24)
!50 = !DILocation(line: 47, column: 24, scope: !24)
!51 = !DILocation(line: 47, column: 13, scope: !24)
!52 = !DILocation(line: 49, column: 5, scope: !25)
!53 = !DILocalVariable(name: "structCharVoid", scope: !54, file: !17, line: 53, type: !26)
!54 = distinct !DILexicalBlock(scope: !55, file: !17, line: 52, column: 9)
!55 = distinct !DILexicalBlock(scope: !21, file: !17, line: 51, column: 5)
!56 = !DILocation(line: 53, column: 22, scope: !54)
!57 = !DILocation(line: 54, column: 28, scope: !54)
!58 = !DILocation(line: 54, column: 39, scope: !54)
!59 = !DILocation(line: 56, column: 50, scope: !54)
!60 = !DILocation(line: 56, column: 24, scope: !54)
!61 = !DILocation(line: 56, column: 13, scope: !54)
!62 = !DILocation(line: 58, column: 35, scope: !54)
!63 = !DILocation(line: 58, column: 13, scope: !54)
!64 = !DILocation(line: 59, column: 28, scope: !54)
!65 = !DILocation(line: 59, column: 13, scope: !54)
!66 = !DILocation(line: 59, column: 92, scope: !54)
!67 = !DILocation(line: 60, column: 50, scope: !54)
!68 = !DILocation(line: 60, column: 35, scope: !54)
!69 = !DILocation(line: 60, column: 13, scope: !54)
!70 = !DILocation(line: 61, column: 50, scope: !54)
!71 = !DILocation(line: 61, column: 24, scope: !54)
!72 = !DILocation(line: 61, column: 13, scope: !54)
!73 = !DILocation(line: 64, column: 1, scope: !16)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_good", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 105, column: 5, scope: !74)
!76 = !DILocation(line: 106, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 117, type: !78, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!8, !8, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !17, line: 117, type: !8)
!84 = !DILocation(line: 117, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !17, line: 117, type: !80)
!86 = !DILocation(line: 117, column: 27, scope: !77)
!87 = !DILocation(line: 120, column: 22, scope: !77)
!88 = !DILocation(line: 120, column: 12, scope: !77)
!89 = !DILocation(line: 120, column: 5, scope: !77)
!90 = !DILocation(line: 122, column: 5, scope: !77)
!91 = !DILocation(line: 123, column: 5, scope: !77)
!92 = !DILocation(line: 124, column: 5, scope: !77)
!93 = !DILocation(line: 127, column: 5, scope: !77)
!94 = !DILocation(line: 128, column: 5, scope: !77)
!95 = !DILocation(line: 129, column: 5, scope: !77)
!96 = !DILocation(line: 131, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 71, type: !18, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 73, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !97, file: !17, line: 73, column: 8)
!100 = !DILocation(line: 73, column: 8, scope: !97)
!101 = !DILocalVariable(name: "structCharVoid", scope: !102, file: !17, line: 76, type: !26)
!102 = distinct !DILexicalBlock(scope: !103, file: !17, line: 75, column: 9)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 74, column: 5)
!104 = !DILocation(line: 76, column: 22, scope: !102)
!105 = !DILocation(line: 77, column: 28, scope: !102)
!106 = !DILocation(line: 77, column: 39, scope: !102)
!107 = !DILocation(line: 79, column: 50, scope: !102)
!108 = !DILocation(line: 79, column: 24, scope: !102)
!109 = !DILocation(line: 79, column: 13, scope: !102)
!110 = !DILocation(line: 81, column: 35, scope: !102)
!111 = !DILocation(line: 81, column: 13, scope: !102)
!112 = !DILocation(line: 82, column: 28, scope: !102)
!113 = !DILocation(line: 82, column: 13, scope: !102)
!114 = !DILocation(line: 82, column: 92, scope: !102)
!115 = !DILocation(line: 83, column: 50, scope: !102)
!116 = !DILocation(line: 83, column: 35, scope: !102)
!117 = !DILocation(line: 83, column: 13, scope: !102)
!118 = !DILocation(line: 84, column: 50, scope: !102)
!119 = !DILocation(line: 84, column: 24, scope: !102)
!120 = !DILocation(line: 84, column: 13, scope: !102)
!121 = !DILocation(line: 86, column: 5, scope: !103)
!122 = !DILocalVariable(name: "structCharVoid", scope: !123, file: !17, line: 90, type: !26)
!123 = distinct !DILexicalBlock(scope: !124, file: !17, line: 89, column: 9)
!124 = distinct !DILexicalBlock(scope: !99, file: !17, line: 88, column: 5)
!125 = !DILocation(line: 90, column: 22, scope: !123)
!126 = !DILocation(line: 91, column: 28, scope: !123)
!127 = !DILocation(line: 91, column: 39, scope: !123)
!128 = !DILocation(line: 93, column: 50, scope: !123)
!129 = !DILocation(line: 93, column: 24, scope: !123)
!130 = !DILocation(line: 93, column: 13, scope: !123)
!131 = !DILocation(line: 95, column: 35, scope: !123)
!132 = !DILocation(line: 95, column: 13, scope: !123)
!133 = !DILocation(line: 96, column: 28, scope: !123)
!134 = !DILocation(line: 96, column: 13, scope: !123)
!135 = !DILocation(line: 96, column: 92, scope: !123)
!136 = !DILocation(line: 97, column: 50, scope: !123)
!137 = !DILocation(line: 97, column: 35, scope: !123)
!138 = !DILocation(line: 97, column: 13, scope: !123)
!139 = !DILocation(line: 98, column: 50, scope: !123)
!140 = !DILocation(line: 98, column: 24, scope: !123)
!141 = !DILocation(line: 98, column: 13, scope: !123)
!142 = !DILocation(line: 101, column: 1, scope: !97)
