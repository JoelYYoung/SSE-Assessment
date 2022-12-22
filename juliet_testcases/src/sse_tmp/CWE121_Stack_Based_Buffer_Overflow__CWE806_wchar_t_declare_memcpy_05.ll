; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %6 = bitcast i32* %5 to i8*, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !50
  %call2 = call i64 @wcslen(i32* %7) #8, !dbg !51
  %mul = mul i64 %call2, 4, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !48
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !53
  store i32 0, i32* %arrayidx3, align 4, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %8), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  %0 = load i32, i32* @staticFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !97
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %6 = bitcast i32* %5 to i8*, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %call2 = call i64 @wcslen(i32* %7) #8, !dbg !106
  %mul = mul i64 %call2, 4, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %8), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !118
  store i32* %arraydecay, i32** %data, align 8, !dbg !119
  %0 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %0, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !125
  %2 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !131
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !132
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  %6 = bitcast i32* %5 to i8*, !dbg !132
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %call2 = call i64 @wcslen(i32* %7) #8, !dbg !135
  %mul = mul i64 %call2, 4, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !132
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !137
  store i32 0, i32* %arrayidx3, align 4, !dbg !138
  %8 = load i32*, i32** %data, align 8, !dbg !139
  call void @printWLine(i32* %8), !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocation(line: 34, column: 12, scope: !18)
!32 = !DILocation(line: 34, column: 10, scope: !18)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 8, scope: !18)
!36 = !DILocation(line: 38, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 9, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 21, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !10, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 44, column: 9, scope: !43)
!49 = !DILocation(line: 44, column: 22, scope: !43)
!50 = !DILocation(line: 44, column: 35, scope: !43)
!51 = !DILocation(line: 44, column: 28, scope: !43)
!52 = !DILocation(line: 44, column: 40, scope: !43)
!53 = !DILocation(line: 45, column: 9, scope: !43)
!54 = !DILocation(line: 45, column: 20, scope: !43)
!55 = !DILocation(line: 46, column: 20, scope: !43)
!56 = !DILocation(line: 46, column: 9, scope: !43)
!57 = !DILocation(line: 48, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_05_good", scope: !10, file: !10, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 103, column: 5, scope: !58)
!60 = !DILocation(line: 104, column: 5, scope: !58)
!61 = !DILocation(line: 105, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 117, type: !63, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!11, !11, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !10, line: 117, type: !11)
!69 = !DILocation(line: 117, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !10, line: 117, type: !65)
!71 = !DILocation(line: 117, column: 27, scope: !62)
!72 = !DILocation(line: 120, column: 22, scope: !62)
!73 = !DILocation(line: 120, column: 12, scope: !62)
!74 = !DILocation(line: 120, column: 5, scope: !62)
!75 = !DILocation(line: 122, column: 5, scope: !62)
!76 = !DILocation(line: 123, column: 5, scope: !62)
!77 = !DILocation(line: 124, column: 5, scope: !62)
!78 = !DILocation(line: 127, column: 5, scope: !62)
!79 = !DILocation(line: 128, column: 5, scope: !62)
!80 = !DILocation(line: 129, column: 5, scope: !62)
!81 = !DILocation(line: 131, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !10, line: 57, type: !22)
!84 = !DILocation(line: 57, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !10, line: 58, type: !27)
!86 = !DILocation(line: 58, column: 13, scope: !82)
!87 = !DILocation(line: 59, column: 12, scope: !82)
!88 = !DILocation(line: 59, column: 10, scope: !82)
!89 = !DILocation(line: 60, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !10, line: 60, column: 8)
!91 = !DILocation(line: 60, column: 8, scope: !82)
!92 = !DILocation(line: 63, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 61, column: 5)
!94 = !DILocation(line: 64, column: 5, scope: !93)
!95 = !DILocation(line: 68, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !10, line: 66, column: 5)
!97 = !DILocation(line: 68, column: 9, scope: !96)
!98 = !DILocation(line: 69, column: 9, scope: !96)
!99 = !DILocation(line: 69, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !10, line: 72, type: !44)
!101 = distinct !DILexicalBlock(scope: !82, file: !10, line: 71, column: 5)
!102 = !DILocation(line: 72, column: 17, scope: !101)
!103 = !DILocation(line: 74, column: 9, scope: !101)
!104 = !DILocation(line: 74, column: 22, scope: !101)
!105 = !DILocation(line: 74, column: 35, scope: !101)
!106 = !DILocation(line: 74, column: 28, scope: !101)
!107 = !DILocation(line: 74, column: 40, scope: !101)
!108 = !DILocation(line: 75, column: 9, scope: !101)
!109 = !DILocation(line: 75, column: 20, scope: !101)
!110 = !DILocation(line: 76, column: 20, scope: !101)
!111 = !DILocation(line: 76, column: 9, scope: !101)
!112 = !DILocation(line: 78, column: 1, scope: !82)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !10, line: 83, type: !22)
!115 = !DILocation(line: 83, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !10, line: 84, type: !27)
!117 = !DILocation(line: 84, column: 13, scope: !113)
!118 = !DILocation(line: 85, column: 12, scope: !113)
!119 = !DILocation(line: 85, column: 10, scope: !113)
!120 = !DILocation(line: 86, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !10, line: 86, column: 8)
!122 = !DILocation(line: 86, column: 8, scope: !113)
!123 = !DILocation(line: 89, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 87, column: 5)
!125 = !DILocation(line: 89, column: 9, scope: !124)
!126 = !DILocation(line: 90, column: 9, scope: !124)
!127 = !DILocation(line: 90, column: 20, scope: !124)
!128 = !DILocation(line: 91, column: 5, scope: !124)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !10, line: 93, type: !44)
!130 = distinct !DILexicalBlock(scope: !113, file: !10, line: 92, column: 5)
!131 = !DILocation(line: 93, column: 17, scope: !130)
!132 = !DILocation(line: 95, column: 9, scope: !130)
!133 = !DILocation(line: 95, column: 22, scope: !130)
!134 = !DILocation(line: 95, column: 35, scope: !130)
!135 = !DILocation(line: 95, column: 28, scope: !130)
!136 = !DILocation(line: 95, column: 40, scope: !130)
!137 = !DILocation(line: 96, column: 9, scope: !130)
!138 = !DILocation(line: 96, column: 20, scope: !130)
!139 = !DILocation(line: 97, column: 20, scope: !130)
!140 = !DILocation(line: 97, column: 9, scope: !130)
!141 = !DILocation(line: 99, column: 1, scope: !113)
