; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_05.c"
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !50
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !51
  store i32 0, i32* %arrayidx4, align 4, !dbg !52
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !53
  %1 = load i32*, i32** %data, align 8, !dbg !54
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %1) #4, !dbg !55
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay7), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #4, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #4, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !89
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %0 = load i32, i32* @staticFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %0, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay1, i32** %data, align 8, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !104
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !105
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !106
  store i32 0, i32* %arrayidx4, align 4, !dbg !107
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %1) #4, !dbg !110
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !111
  call void @printWLine(i32* %arraydecay7), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %0 = load i32, i32* @staticTrue, align 4, !dbg !123
  %tobool = icmp ne i32 %0, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay1, i32** %data, align 8, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !133
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !134
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !135
  store i32 0, i32* %arrayidx4, align 4, !dbg !136
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !137
  %1 = load i32*, i32** %data, align 8, !dbg !138
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %1) #4, !dbg !139
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !140
  call void @printWLine(i32* %arraydecay7), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocation(line: 34, column: 13, scope: !18)
!32 = !DILocation(line: 34, column: 5, scope: !18)
!33 = !DILocation(line: 35, column: 5, scope: !18)
!34 = !DILocation(line: 35, column: 23, scope: !18)
!35 = !DILocation(line: 36, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!37 = !DILocation(line: 36, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 37, column: 5)
!40 = !DILocation(line: 39, column: 27, scope: !39)
!41 = !DILocation(line: 39, column: 14, scope: !39)
!42 = !DILocation(line: 40, column: 5, scope: !39)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !10, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 200)
!48 = !DILocation(line: 42, column: 17, scope: !44)
!49 = !DILocation(line: 43, column: 17, scope: !44)
!50 = !DILocation(line: 43, column: 9, scope: !44)
!51 = !DILocation(line: 44, column: 9, scope: !44)
!52 = !DILocation(line: 44, column: 23, scope: !44)
!53 = !DILocation(line: 46, column: 16, scope: !44)
!54 = !DILocation(line: 46, column: 22, scope: !44)
!55 = !DILocation(line: 46, column: 9, scope: !44)
!56 = !DILocation(line: 47, column: 20, scope: !44)
!57 = !DILocation(line: 47, column: 9, scope: !44)
!58 = !DILocation(line: 49, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_05_good", scope: !10, file: !10, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 106, column: 5, scope: !59)
!61 = !DILocation(line: 107, column: 5, scope: !59)
!62 = !DILocation(line: 108, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 120, type: !64, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!11, !11, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !10, line: 120, type: !11)
!70 = !DILocation(line: 120, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !10, line: 120, type: !66)
!72 = !DILocation(line: 120, column: 27, scope: !63)
!73 = !DILocation(line: 123, column: 22, scope: !63)
!74 = !DILocation(line: 123, column: 12, scope: !63)
!75 = !DILocation(line: 123, column: 5, scope: !63)
!76 = !DILocation(line: 125, column: 5, scope: !63)
!77 = !DILocation(line: 126, column: 5, scope: !63)
!78 = !DILocation(line: 127, column: 5, scope: !63)
!79 = !DILocation(line: 130, column: 5, scope: !63)
!80 = !DILocation(line: 131, column: 5, scope: !63)
!81 = !DILocation(line: 132, column: 5, scope: !63)
!82 = !DILocation(line: 134, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !10, line: 58, type: !22)
!85 = !DILocation(line: 58, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !10, line: 59, type: !27)
!87 = !DILocation(line: 59, column: 13, scope: !83)
!88 = !DILocation(line: 60, column: 13, scope: !83)
!89 = !DILocation(line: 60, column: 5, scope: !83)
!90 = !DILocation(line: 61, column: 5, scope: !83)
!91 = !DILocation(line: 61, column: 23, scope: !83)
!92 = !DILocation(line: 62, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !10, line: 62, column: 8)
!94 = !DILocation(line: 62, column: 8, scope: !83)
!95 = !DILocation(line: 65, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !10, line: 63, column: 5)
!97 = !DILocation(line: 66, column: 5, scope: !96)
!98 = !DILocation(line: 70, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !10, line: 68, column: 5)
!100 = !DILocation(line: 70, column: 14, scope: !99)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !10, line: 73, type: !45)
!102 = distinct !DILexicalBlock(scope: !83, file: !10, line: 72, column: 5)
!103 = !DILocation(line: 73, column: 17, scope: !102)
!104 = !DILocation(line: 74, column: 17, scope: !102)
!105 = !DILocation(line: 74, column: 9, scope: !102)
!106 = !DILocation(line: 75, column: 9, scope: !102)
!107 = !DILocation(line: 75, column: 23, scope: !102)
!108 = !DILocation(line: 77, column: 16, scope: !102)
!109 = !DILocation(line: 77, column: 22, scope: !102)
!110 = !DILocation(line: 77, column: 9, scope: !102)
!111 = !DILocation(line: 78, column: 20, scope: !102)
!112 = !DILocation(line: 78, column: 9, scope: !102)
!113 = !DILocation(line: 80, column: 1, scope: !83)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !10, line: 85, type: !22)
!116 = !DILocation(line: 85, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !10, line: 86, type: !27)
!118 = !DILocation(line: 86, column: 13, scope: !114)
!119 = !DILocation(line: 87, column: 13, scope: !114)
!120 = !DILocation(line: 87, column: 5, scope: !114)
!121 = !DILocation(line: 88, column: 5, scope: !114)
!122 = !DILocation(line: 88, column: 23, scope: !114)
!123 = !DILocation(line: 89, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !10, line: 89, column: 8)
!125 = !DILocation(line: 89, column: 8, scope: !114)
!126 = !DILocation(line: 92, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 90, column: 5)
!128 = !DILocation(line: 92, column: 14, scope: !127)
!129 = !DILocation(line: 93, column: 5, scope: !127)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !10, line: 95, type: !45)
!131 = distinct !DILexicalBlock(scope: !114, file: !10, line: 94, column: 5)
!132 = !DILocation(line: 95, column: 17, scope: !131)
!133 = !DILocation(line: 96, column: 17, scope: !131)
!134 = !DILocation(line: 96, column: 9, scope: !131)
!135 = !DILocation(line: 97, column: 9, scope: !131)
!136 = !DILocation(line: 97, column: 23, scope: !131)
!137 = !DILocation(line: 99, column: 16, scope: !131)
!138 = !DILocation(line: 99, column: 22, scope: !131)
!139 = !DILocation(line: 99, column: 9, scope: !131)
!140 = !DILocation(line: 100, column: 20, scope: !131)
!141 = !DILocation(line: 100, column: 9, scope: !131)
!142 = !DILocation(line: 102, column: 1, scope: !114)
