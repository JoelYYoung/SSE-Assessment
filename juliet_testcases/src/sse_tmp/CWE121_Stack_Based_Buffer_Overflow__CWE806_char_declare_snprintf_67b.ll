; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType = type { i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %call = call i64 @strlen(i8* %2) #6, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* %4), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !38 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType* %myStruct, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !43
  %0 = load i8*, i8** %structFirst, align 8, !dbg !43
  store i8* %0, i8** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !46
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %2 = load i8*, i8** %data, align 8, !dbg !48
  %call = call i64 @strlen(i8* %2) #6, !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !50
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %4), !dbg !53
  ret void, !dbg !54
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b_badSink", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType", file: !10, line: 30, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67_structType", file: !10, line: 27, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 29, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 34, type: !13)
!20 = !DILocation(line: 34, column: 162, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 36, type: !17)
!22 = !DILocation(line: 36, column: 12, scope: !9)
!23 = !DILocation(line: 36, column: 28, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 38, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 37, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 38, column: 14, scope: !25)
!30 = !DILocation(line: 40, column: 18, scope: !25)
!31 = !DILocation(line: 40, column: 31, scope: !25)
!32 = !DILocation(line: 40, column: 24, scope: !25)
!33 = !DILocation(line: 40, column: 44, scope: !25)
!34 = !DILocation(line: 40, column: 9, scope: !25)
!35 = !DILocation(line: 41, column: 19, scope: !25)
!36 = !DILocation(line: 41, column: 9, scope: !25)
!37 = !DILocation(line: 43, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_67b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "myStruct", arg: 1, scope: !38, file: !10, line: 50, type: !13)
!40 = !DILocation(line: 50, column: 166, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !10, line: 52, type: !17)
!42 = !DILocation(line: 52, column: 12, scope: !38)
!43 = !DILocation(line: 52, column: 28, scope: !38)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !10, line: 54, type: !26)
!45 = distinct !DILexicalBlock(scope: !38, file: !10, line: 53, column: 5)
!46 = !DILocation(line: 54, column: 14, scope: !45)
!47 = !DILocation(line: 56, column: 18, scope: !45)
!48 = !DILocation(line: 56, column: 31, scope: !45)
!49 = !DILocation(line: 56, column: 24, scope: !45)
!50 = !DILocation(line: 56, column: 44, scope: !45)
!51 = !DILocation(line: 56, column: 9, scope: !45)
!52 = !DILocation(line: 57, column: 19, scope: !45)
!53 = !DILocation(line: 57, column: 9, scope: !45)
!54 = !DILocation(line: 59, column: 1, scope: !38)