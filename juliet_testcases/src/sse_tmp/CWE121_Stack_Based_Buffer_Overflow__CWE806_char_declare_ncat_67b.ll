; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %call = call i64 @strlen(i8* %3) #6, !dbg !33
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call) #7, !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* %4), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !40 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType* %myStruct, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType* %myStruct, i32 0, i32 0, !dbg !45
  %0 = load i8*, i8** %structFirst, align 8, !dbg !45
  store i8* %0, i8** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !48
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %2 = load i8*, i8** %data, align 8, !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %call = call i64 @strlen(i8* %3) #6, !dbg !52
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call) #7, !dbg !53
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !54
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  %4 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %4), !dbg !57
  ret void, !dbg !58
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!20 = !DILocation(line: 28, column: 154, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!22 = !DILocation(line: 30, column: 12, scope: !9)
!23 = !DILocation(line: 30, column: 28, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocation(line: 34, column: 17, scope: !25)
!31 = !DILocation(line: 34, column: 23, scope: !25)
!32 = !DILocation(line: 34, column: 36, scope: !25)
!33 = !DILocation(line: 34, column: 29, scope: !25)
!34 = !DILocation(line: 34, column: 9, scope: !25)
!35 = !DILocation(line: 35, column: 9, scope: !25)
!36 = !DILocation(line: 35, column: 20, scope: !25)
!37 = !DILocation(line: 36, column: 19, scope: !25)
!38 = !DILocation(line: 36, column: 9, scope: !25)
!39 = !DILocation(line: 38, column: 1, scope: !9)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_67b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "myStruct", arg: 1, scope: !40, file: !10, line: 45, type: !13)
!42 = !DILocation(line: 45, column: 158, scope: !40)
!43 = !DILocalVariable(name: "data", scope: !40, file: !10, line: 47, type: !17)
!44 = !DILocation(line: 47, column: 12, scope: !40)
!45 = !DILocation(line: 47, column: 28, scope: !40)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !10, line: 49, type: !26)
!47 = distinct !DILexicalBlock(scope: !40, file: !10, line: 48, column: 5)
!48 = !DILocation(line: 49, column: 14, scope: !47)
!49 = !DILocation(line: 51, column: 17, scope: !47)
!50 = !DILocation(line: 51, column: 23, scope: !47)
!51 = !DILocation(line: 51, column: 36, scope: !47)
!52 = !DILocation(line: 51, column: 29, scope: !47)
!53 = !DILocation(line: 51, column: 9, scope: !47)
!54 = !DILocation(line: 52, column: 9, scope: !47)
!55 = !DILocation(line: 52, column: 20, scope: !47)
!56 = !DILocation(line: 53, column: 19, scope: !47)
!57 = !DILocation(line: 53, column: 9, scope: !47)
!58 = !DILocation(line: 55, column: 1, scope: !40)
