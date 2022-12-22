; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %structCharVoid6 = alloca %struct._charVoid, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !18
  %tobool = icmp ne i32 %call, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !21, metadata !DIExpression()), !dbg !33
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !35
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !36
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !36
  call void @printLine(i8* %0), !dbg !37
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !38
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !39
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !40
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !43
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !44
  call void @printLine(i8* %arraydecay4), !dbg !45
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !46
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !46
  call void @printLine(i8* %1), !dbg !47
  br label %if.end, !dbg !48

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid6, metadata !49, metadata !DIExpression()), !dbg !52
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !53
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond7, align 8, !dbg !54
  %voidSecond8 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !55
  %2 = load i8*, i8** %voidSecond8, align 8, !dbg !55
  call void @printLine(i8* %2), !dbg !56
  %charFirst9 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !57
  %arraydecay10 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst9, i64 0, i64 0, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay10, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !58
  %charFirst11 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !59
  %arrayidx12 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst11, i64 0, i64 15, !dbg !60
  store i8 0, i8* %arrayidx12, align 1, !dbg !61
  %charFirst13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !62
  %arraydecay14 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst13, i64 0, i64 0, !dbg !63
  call void @printLine(i8* %arraydecay14), !dbg !64
  %voidSecond15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !65
  %3 = load i8*, i8** %voidSecond15, align 8, !dbg !65
  call void @printLine(i8* %3), !dbg !66
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !67
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare dso_local void @printLine(i8*) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12_good() #0 !dbg !68 {
entry:
  call void @good1(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !90 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  %structCharVoid6 = alloca %struct._charVoid, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !94, metadata !DIExpression()), !dbg !97
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !98
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !99
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !100
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !100
  call void @printLine(i8* %0), !dbg !101
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !102
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !103
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !104
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !107
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !108
  call void @printLine(i8* %arraydecay4), !dbg !109
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !110
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !110
  call void @printLine(i8* %1), !dbg !111
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid6, metadata !113, metadata !DIExpression()), !dbg !116
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !117
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond7, align 8, !dbg !118
  %voidSecond8 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !119
  %2 = load i8*, i8** %voidSecond8, align 8, !dbg !119
  call void @printLine(i8* %2), !dbg !120
  %charFirst9 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !121
  %arraydecay10 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst9, i64 0, i64 0, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay10, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !122
  %charFirst11 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !123
  %arrayidx12 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst11, i64 0, i64 15, !dbg !124
  store i8 0, i8* %arrayidx12, align 1, !dbg !125
  %charFirst13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 0, !dbg !126
  %arraydecay14 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst13, i64 0, i64 0, !dbg !127
  call void @printLine(i8* %arraydecay14), !dbg !128
  %voidSecond15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid6, i32 0, i32 1, !dbg !129
  %3 = load i8*, i8** %voidSecond15, align 8, !dbg !129
  call void @printLine(i8* %3), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 36, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 8)
!20 = !DILocation(line: 36, column: 8, scope: !14)
!21 = !DILocalVariable(name: "structCharVoid", scope: !22, file: !15, line: 39, type: !24)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 38, column: 9)
!23 = distinct !DILexicalBlock(scope: !19, file: !15, line: 37, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !26)
!26 = !{!27, !31, !32}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !25, file: !15, line: 27, baseType: !28, size: 128)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 16)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !25, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !25, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!33 = !DILocation(line: 39, column: 22, scope: !22)
!34 = !DILocation(line: 40, column: 28, scope: !22)
!35 = !DILocation(line: 40, column: 39, scope: !22)
!36 = !DILocation(line: 42, column: 46, scope: !22)
!37 = !DILocation(line: 42, column: 13, scope: !22)
!38 = !DILocation(line: 44, column: 35, scope: !22)
!39 = !DILocation(line: 44, column: 13, scope: !22)
!40 = !DILocation(line: 45, column: 28, scope: !22)
!41 = !DILocation(line: 45, column: 13, scope: !22)
!42 = !DILocation(line: 45, column: 89, scope: !22)
!43 = !DILocation(line: 46, column: 46, scope: !22)
!44 = !DILocation(line: 46, column: 31, scope: !22)
!45 = !DILocation(line: 46, column: 13, scope: !22)
!46 = !DILocation(line: 47, column: 46, scope: !22)
!47 = !DILocation(line: 47, column: 13, scope: !22)
!48 = !DILocation(line: 49, column: 5, scope: !23)
!49 = !DILocalVariable(name: "structCharVoid", scope: !50, file: !15, line: 53, type: !24)
!50 = distinct !DILexicalBlock(scope: !51, file: !15, line: 52, column: 9)
!51 = distinct !DILexicalBlock(scope: !19, file: !15, line: 51, column: 5)
!52 = !DILocation(line: 53, column: 22, scope: !50)
!53 = !DILocation(line: 54, column: 28, scope: !50)
!54 = !DILocation(line: 54, column: 39, scope: !50)
!55 = !DILocation(line: 56, column: 46, scope: !50)
!56 = !DILocation(line: 56, column: 13, scope: !50)
!57 = !DILocation(line: 58, column: 35, scope: !50)
!58 = !DILocation(line: 58, column: 13, scope: !50)
!59 = !DILocation(line: 59, column: 28, scope: !50)
!60 = !DILocation(line: 59, column: 13, scope: !50)
!61 = !DILocation(line: 59, column: 89, scope: !50)
!62 = !DILocation(line: 60, column: 46, scope: !50)
!63 = !DILocation(line: 60, column: 31, scope: !50)
!64 = !DILocation(line: 60, column: 13, scope: !50)
!65 = !DILocation(line: 61, column: 46, scope: !50)
!66 = !DILocation(line: 61, column: 13, scope: !50)
!67 = !DILocation(line: 64, column: 1, scope: !14)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_12_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 105, column: 5, scope: !68)
!70 = !DILocation(line: 106, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 117, type: !72, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 117, type: !74)
!77 = !DILocation(line: 117, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 117, type: !75)
!79 = !DILocation(line: 117, column: 27, scope: !71)
!80 = !DILocation(line: 120, column: 22, scope: !71)
!81 = !DILocation(line: 120, column: 12, scope: !71)
!82 = !DILocation(line: 120, column: 5, scope: !71)
!83 = !DILocation(line: 122, column: 5, scope: !71)
!84 = !DILocation(line: 123, column: 5, scope: !71)
!85 = !DILocation(line: 124, column: 5, scope: !71)
!86 = !DILocation(line: 127, column: 5, scope: !71)
!87 = !DILocation(line: 128, column: 5, scope: !71)
!88 = !DILocation(line: 129, column: 5, scope: !71)
!89 = !DILocation(line: 131, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 73, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !15, line: 73, column: 8)
!93 = !DILocation(line: 73, column: 8, scope: !90)
!94 = !DILocalVariable(name: "structCharVoid", scope: !95, file: !15, line: 76, type: !24)
!95 = distinct !DILexicalBlock(scope: !96, file: !15, line: 75, column: 9)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 74, column: 5)
!97 = !DILocation(line: 76, column: 22, scope: !95)
!98 = !DILocation(line: 77, column: 28, scope: !95)
!99 = !DILocation(line: 77, column: 39, scope: !95)
!100 = !DILocation(line: 79, column: 46, scope: !95)
!101 = !DILocation(line: 79, column: 13, scope: !95)
!102 = !DILocation(line: 81, column: 35, scope: !95)
!103 = !DILocation(line: 81, column: 13, scope: !95)
!104 = !DILocation(line: 82, column: 28, scope: !95)
!105 = !DILocation(line: 82, column: 13, scope: !95)
!106 = !DILocation(line: 82, column: 89, scope: !95)
!107 = !DILocation(line: 83, column: 46, scope: !95)
!108 = !DILocation(line: 83, column: 31, scope: !95)
!109 = !DILocation(line: 83, column: 13, scope: !95)
!110 = !DILocation(line: 84, column: 46, scope: !95)
!111 = !DILocation(line: 84, column: 13, scope: !95)
!112 = !DILocation(line: 86, column: 5, scope: !96)
!113 = !DILocalVariable(name: "structCharVoid", scope: !114, file: !15, line: 90, type: !24)
!114 = distinct !DILexicalBlock(scope: !115, file: !15, line: 89, column: 9)
!115 = distinct !DILexicalBlock(scope: !92, file: !15, line: 88, column: 5)
!116 = !DILocation(line: 90, column: 22, scope: !114)
!117 = !DILocation(line: 91, column: 28, scope: !114)
!118 = !DILocation(line: 91, column: 39, scope: !114)
!119 = !DILocation(line: 93, column: 46, scope: !114)
!120 = !DILocation(line: 93, column: 13, scope: !114)
!121 = !DILocation(line: 95, column: 35, scope: !114)
!122 = !DILocation(line: 95, column: 13, scope: !114)
!123 = !DILocation(line: 96, column: 28, scope: !114)
!124 = !DILocation(line: 96, column: 13, scope: !114)
!125 = !DILocation(line: 96, column: 89, scope: !114)
!126 = !DILocation(line: 97, column: 46, scope: !114)
!127 = !DILocation(line: 97, column: 31, scope: !114)
!128 = !DILocation(line: 97, column: 13, scope: !114)
!129 = !DILocation(line: 98, column: 46, scope: !114)
!130 = !DILocation(line: 98, column: 13, scope: !114)
!131 = !DILocation(line: 101, column: 1, scope: !90)
