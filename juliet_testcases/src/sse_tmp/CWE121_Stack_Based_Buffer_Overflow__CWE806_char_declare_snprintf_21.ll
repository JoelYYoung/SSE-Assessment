; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !62
  %2 = load i8*, i8** %data.addr, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !66
  ret i8* %3, !dbg !67
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !95
  store i8* %arraydecay, i8** %data, align 8, !dbg !96
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !99
  store i8* %call, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !103
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !104
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %4), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !123
  %2 = load i8*, i8** %data.addr, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !126
  ret i8* %3, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !133
  store i8* %arraydecay, i8** %data, align 8, !dbg !134
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !135
  %0 = load i8*, i8** %data, align 8, !dbg !136
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !137
  store i8* %call, i8** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !141
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !142
  %2 = load i8*, i8** %data, align 8, !dbg !143
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !144
  %3 = load i8*, i8** %data, align 8, !dbg !145
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !146
  %4 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %4), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !158
  %2 = load i8*, i8** %data.addr, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !162
  ret i8* %3, !dbg !163
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 63, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 64, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21_bad", scope: !10, file: !10, line: 43, type: !21, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 45, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 45, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 46, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 46, column: 10, scope: !20)
!32 = !DILocation(line: 47, column: 12, scope: !20)
!33 = !DILocation(line: 47, column: 10, scope: !20)
!34 = !DILocation(line: 48, column: 15, scope: !20)
!35 = !DILocation(line: 49, column: 22, scope: !20)
!36 = !DILocation(line: 49, column: 12, scope: !20)
!37 = !DILocation(line: 49, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 51, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 50, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 51, column: 14, scope: !39)
!44 = !DILocation(line: 53, column: 18, scope: !39)
!45 = !DILocation(line: 53, column: 31, scope: !39)
!46 = !DILocation(line: 53, column: 24, scope: !39)
!47 = !DILocation(line: 53, column: 44, scope: !39)
!48 = !DILocation(line: 53, column: 9, scope: !39)
!49 = !DILocation(line: 54, column: 19, scope: !39)
!50 = !DILocation(line: 54, column: 9, scope: !39)
!51 = !DILocation(line: 56, column: 1, scope: !20)
!52 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 32, type: !53, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!24, !24}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !10, line: 32, type: !24)
!56 = !DILocation(line: 32, column: 32, scope: !52)
!57 = !DILocation(line: 34, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !10, line: 34, column: 8)
!59 = !DILocation(line: 34, column: 8, scope: !52)
!60 = !DILocation(line: 37, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !10, line: 35, column: 5)
!62 = !DILocation(line: 37, column: 9, scope: !61)
!63 = !DILocation(line: 38, column: 9, scope: !61)
!64 = !DILocation(line: 38, column: 21, scope: !61)
!65 = !DILocation(line: 39, column: 5, scope: !61)
!66 = !DILocation(line: 40, column: 12, scope: !52)
!67 = !DILocation(line: 40, column: 5, scope: !52)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_21_good", scope: !10, file: !10, line: 125, type: !21, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 127, column: 5, scope: !68)
!70 = !DILocation(line: 128, column: 5, scope: !68)
!71 = !DILocation(line: 129, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 141, type: !73, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!11, !11, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !10, line: 141, type: !11)
!77 = !DILocation(line: 141, column: 14, scope: !72)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !10, line: 141, type: !75)
!79 = !DILocation(line: 141, column: 27, scope: !72)
!80 = !DILocation(line: 144, column: 22, scope: !72)
!81 = !DILocation(line: 144, column: 12, scope: !72)
!82 = !DILocation(line: 144, column: 5, scope: !72)
!83 = !DILocation(line: 146, column: 5, scope: !72)
!84 = !DILocation(line: 147, column: 5, scope: !72)
!85 = !DILocation(line: 148, column: 5, scope: !72)
!86 = !DILocation(line: 151, column: 5, scope: !72)
!87 = !DILocation(line: 152, column: 5, scope: !72)
!88 = !DILocation(line: 153, column: 5, scope: !72)
!89 = !DILocation(line: 155, column: 5, scope: !72)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 85, type: !24)
!92 = !DILocation(line: 85, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !10, line: 86, type: !28)
!94 = !DILocation(line: 86, column: 10, scope: !90)
!95 = !DILocation(line: 87, column: 12, scope: !90)
!96 = !DILocation(line: 87, column: 10, scope: !90)
!97 = !DILocation(line: 88, column: 20, scope: !90)
!98 = !DILocation(line: 89, column: 27, scope: !90)
!99 = !DILocation(line: 89, column: 12, scope: !90)
!100 = !DILocation(line: 89, column: 10, scope: !90)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !10, line: 91, type: !40)
!102 = distinct !DILexicalBlock(scope: !90, file: !10, line: 90, column: 5)
!103 = !DILocation(line: 91, column: 14, scope: !102)
!104 = !DILocation(line: 93, column: 18, scope: !102)
!105 = !DILocation(line: 93, column: 31, scope: !102)
!106 = !DILocation(line: 93, column: 24, scope: !102)
!107 = !DILocation(line: 93, column: 44, scope: !102)
!108 = !DILocation(line: 93, column: 9, scope: !102)
!109 = !DILocation(line: 94, column: 19, scope: !102)
!110 = !DILocation(line: 94, column: 9, scope: !102)
!111 = !DILocation(line: 96, column: 1, scope: !90)
!112 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 67, type: !53, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !10, line: 67, type: !24)
!114 = !DILocation(line: 67, column: 37, scope: !112)
!115 = !DILocation(line: 69, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !10, line: 69, column: 8)
!117 = !DILocation(line: 69, column: 8, scope: !112)
!118 = !DILocation(line: 72, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 70, column: 5)
!120 = !DILocation(line: 73, column: 5, scope: !119)
!121 = !DILocation(line: 77, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !10, line: 75, column: 5)
!123 = !DILocation(line: 77, column: 9, scope: !122)
!124 = !DILocation(line: 78, column: 9, scope: !122)
!125 = !DILocation(line: 78, column: 20, scope: !122)
!126 = !DILocation(line: 80, column: 12, scope: !112)
!127 = !DILocation(line: 80, column: 5, scope: !112)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 110, type: !21, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !10, line: 112, type: !24)
!130 = !DILocation(line: 112, column: 12, scope: !128)
!131 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !10, line: 113, type: !28)
!132 = !DILocation(line: 113, column: 10, scope: !128)
!133 = !DILocation(line: 114, column: 12, scope: !128)
!134 = !DILocation(line: 114, column: 10, scope: !128)
!135 = !DILocation(line: 115, column: 20, scope: !128)
!136 = !DILocation(line: 116, column: 27, scope: !128)
!137 = !DILocation(line: 116, column: 12, scope: !128)
!138 = !DILocation(line: 116, column: 10, scope: !128)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !10, line: 118, type: !40)
!140 = distinct !DILexicalBlock(scope: !128, file: !10, line: 117, column: 5)
!141 = !DILocation(line: 118, column: 14, scope: !140)
!142 = !DILocation(line: 120, column: 18, scope: !140)
!143 = !DILocation(line: 120, column: 31, scope: !140)
!144 = !DILocation(line: 120, column: 24, scope: !140)
!145 = !DILocation(line: 120, column: 44, scope: !140)
!146 = !DILocation(line: 120, column: 9, scope: !140)
!147 = !DILocation(line: 121, column: 19, scope: !140)
!148 = !DILocation(line: 121, column: 9, scope: !140)
!149 = !DILocation(line: 123, column: 1, scope: !128)
!150 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 99, type: !53, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !10, line: 99, type: !24)
!152 = !DILocation(line: 99, column: 37, scope: !150)
!153 = !DILocation(line: 101, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !10, line: 101, column: 8)
!155 = !DILocation(line: 101, column: 8, scope: !150)
!156 = !DILocation(line: 104, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !10, line: 102, column: 5)
!158 = !DILocation(line: 104, column: 9, scope: !157)
!159 = !DILocation(line: 105, column: 9, scope: !157)
!160 = !DILocation(line: 105, column: 20, scope: !157)
!161 = !DILocation(line: 106, column: 5, scope: !157)
!162 = !DILocation(line: 107, column: 12, scope: !150)
!163 = !DILocation(line: 107, column: 5, scope: !150)
